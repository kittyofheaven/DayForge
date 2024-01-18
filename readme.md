# Team Description
Meet the dynamic Menacing Monkeys Hackfest Team from Institut Teknologi Sepuluh Nopember: Hazel Handrata, the skilled hacker and PIC; Hana Azizah, the savvy hustler; and Achmad Naufal, the creative hipster. Together, we blend expertise and innovation for a winning combination.
# Repository Description
This repository features two branches: `main` and `PythonModel`. The `main` branch is dedicated to the Swift and SwiftUI codebase for the iOS mobile app, allowing users to interact with the Day Forge Sentiment Analysis API. On the other hand, the `PythonModel` branch hosts the Python model developed using PyTorch and Roberta, presented as a Flask API for sentiment analysis. Developers can integrate this API into various applications. For the mobile app development, simply clone the repository, switch to the `main` branch, open the `/DayForgw` directory in Xcode, and build and run the app. To explore the Python model and API, switch to the `PythonModel` branch, navigate to the `/PythonModel` directory, install dependencies using `pip install -r requirements.txt`, and run the Flask app with `python startup.py`.
# App Description
Day Forge is an iOS online diary journal application whose purpose is to indirectly reduce the number of people with mental health issues. It uses machine learning for early detection of users’ depression state. Day Forge gives recommendation based on depression state especially for depressed users and connect them to platform of psychologist service.
# App Screenshots

- Splashscreen View
![Screenshot 2024-01-12 at 14 34 12](https://github.com/kittyofheaven/DayForge/assets/71081063/9f7b265c-ab37-4f7b-8396-fc0489198f58)

- Journal View
<img width="559" alt="Screenshot 2024-01-12 at 14 39 19" src="https://github.com/kittyofheaven/DayForge/assets/71081063/1967af36-6957-418f-b895-6a0d7f0b3f04">

- New Journal View
![Screenshot 2024-01-12 at 14 35 40](https://github.com/kittyofheaven/DayForge/assets/71081063/3f526805-a754-4a3f-bd87-aea95ae8d2a2)


- Today Mood Journal View
<img width="587" alt="Screenshot 2024-01-12 at 14 39 36" src="https://github.com/kittyofheaven/DayForge/assets/71081063/226fe9f3-6aa4-471d-99f4-92dd12b91ba8">

- Chart View
<img width="256" alt="Screenshot 2024-01-12 at 14 44 55" src="https://github.com/kittyofheaven/DayForge/assets/71081063/762faf47-9abc-4556-a92c-644a0f72b31c">

- Profile View
<img width="559" alt="Screenshot 2024-01-12 at 14 49 51" src="https://github.com/kittyofheaven/DayForge/assets/71081063/55cc2ab5-1116-4556-b68e-1c5ab3b884c9">

# API Description 
This Api is hosted on azure cloud service.
### Introduction
Welcome to the documentation for Day Forge's Sentiment Analysis Machine Learning API. This API allows you to analyze the sentiment of a given text and receive a score along with the corresponding sentiment label. The API endpoint is available at [https://dayforgemlapi.azurewebsites.net/predict_sentiment](https://dayforgemlapi.azurewebsites.net/predict_sentiment).

### Quick Start
To get started, you can make a POST request to the API with a JSON payload containing the text you want to analyze. Here is an example using the `curl` command:

```bash
curl -X POST -H "Content-Type: application/json" -d '{"texts": "running up that hill"}' https://dayforgemlapi.azurewebsites.net/predict_sentiment
```

### Request
- **Endpoint:** `https://dayforgemlapi.azurewebsites.net/predict_sentiment`
- **Method:** POST
- **Headers:**
  - Content-Type: application/json
- **Body:**
  ```json
  {
    "texts": "running up that hill"
  }
  ```

### Response
The API will respond with a JSON object containing the sentiment score and label:

```json
{
  "score": 0.7298,
  "sentiment": "neutral"
}
```

- **score:** A float value indicating the sentiment score.
- **sentiment:** A string indicating the sentiment label (`positive`, `negative`, or `neutral`).

### Example Usage in Python
You can also use the API in Python using the `requests` library:

```python
import requests
import json

url = "https://dayforgemlapi.azurewebsites.net/predict_sentiment"
data = {"texts": "running up that hill"}

response = requests.post(url, json=data)
result = json.loads(response.text)

print("Sentiment Score:", result["score"])
print("Sentiment Label:", result["sentiment"])
```

### Example Usage in Swift
Here's an example of using the Day Forge Sentiment Analysis API in Swift using the `URLSession`:

```swift
import Foundation

func analyzeSentiment() {
    let apiUrl = URL(string: "https://dayforgemlapi.azurewebsites.net/predict_sentiment")!
    
    // Create the request
    var request = URLRequest(url: apiUrl)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Prepare the request body
    let requestBody: [String: Any] = ["texts": "running up that hill"]
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
    } catch {
        print("Error serializing JSON: \(error)")
        return
    }
    
    // Make the API call
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data, error == nil else {
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
            return
        }
        
        do {
            // Parse the JSON response
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            // Extract sentiment information
            if let score = jsonResponse["score"] as? Double,
               let sentiment = jsonResponse["sentiment"] as? String {
                print("Sentiment Score: \(score)")
                print("Sentiment Label: \(sentiment)")
            } else {
                print("Error parsing sentiment information from the response.")
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    task.resume()
}

// Call the function to analyze sentiment
analyzeSentiment()
```

Make sure to run this code in an environment where network requests are allowed.

### Error Handling
In case of errors, the API will return an appropriate HTTP status code along with an error message in the response body.
