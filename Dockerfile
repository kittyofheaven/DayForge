FROM python:3.9.6-slim-buster
WORKDIR /dayforge
COPY app /dayforge/app
COPY startup.py /dayforge
COPY requirements.txt /dayforge

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu


EXPOSE 8000

CMD python startup.py
