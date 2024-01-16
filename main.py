from flask import Flask, request, jsonify
from transformers import AutoModelForSequenceClassification, AutoTokenizer
from scipy.special import softmax
import numpy as np
import csv
import urllib.request

app = Flask(__name__)

def preprocess(text):
    new_text = []

    for t in text.split(" "):
        t = '@user' if t.startswith('@') and len(t) > 1 else t
        t = 'http' if t.startswith('http') else t
        new_text.append(t)
    return " ".join(new_text)

def get_sentiment_scores(text, task='sentiment'):
    MODEL = f"cardiffnlp/twitter-roberta-base-{task}"

    tokenizer = AutoTokenizer.from_pretrained(MODEL)

    # download label mapping
    labels=[]
    mapping_link = f"https://raw.githubusercontent.com/cardiffnlp/tweeteval/main/datasets/{task}/mapping.txt"
    with urllib.request.urlopen(mapping_link) as f:
        html = f.read().decode('utf-8').split("\n")
        csvreader = csv.reader(html, delimiter='\t')
    labels = [row[1] for row in csvreader if len(row) > 1]

    # PT
    model = AutoModelForSequenceClassification.from_pretrained(MODEL)

    text = preprocess(text)
    encoded_input = tokenizer(text, return_tensors='pt')
    output = model(**encoded_input)
    scores = output[0][0].detach().numpy()
    scores = softmax(scores)

    ranking = np.argsort(scores)
    ranking = ranking[::-1]

    results = {}
    for i in range(scores.shape[0]):
        label = labels[ranking[i]]
        score = np.round(float(scores[ranking[i]]), 4)
        results[label] = score

    return results

@app.route('/', methods=['GET'])
def index():
    return jsonify(['Server is running'])

@app.route('/predict_sentiment', methods=['POST'])
def predict_sentiment():
    try:
        data = request.json
        print(data)
        texts = data.get('texts')
        print(texts)

        if not texts:
            return jsonify({"error": "Texts not provided"}), 400

        highest_sentiment = None
        highest_score = -1

        scores = get_sentiment_scores(texts)
        for label, score in scores.items():
            if score > highest_score:
                highest_score = score
                highest_sentiment = label

        result = {"sentiment": highest_sentiment, "score": highest_score}
        return jsonify(result)

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
