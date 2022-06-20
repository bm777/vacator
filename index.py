from flask import Flask


app = Flask(__name__)


@app.route('/')
def home():
    return {"response": "THE API ENDPOINT format is /town/dataset/datetime "}
