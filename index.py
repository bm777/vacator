#!/usr/bin/env python
# coding: utf8

from flask import Flask, jsonify
import pandas as pd


app = Flask(__name__)


def load_forecast():
    """
    Read the forecast
    """
    return pd.read_pickle("forecast.pkl")

@app.route('/')
def home():
    """
    Show the defaulkt format of the principal ENDPOINT
    """
    return {"response": "THE API ENDPOINT format is /<town>/<dataset>/<datetime> "}


@app.route('/<town>/<dataset>/<datetime>') #<>
def _data(town, dataset, datetime):
    """
    grab data the forecast model
    """

    forecast = load_forecast()
    d = forecast
    row_date = d[ d["date"] == datetime+" 00:00:00" ]
    row_town = row_date[row_date["town"] == town]
    row_dataset = row_town[row_town["dataset"] == dataset]
    value = row_dataset["ValueF"].values
    print(value)

    return {
        "response": 'The data from the <'+dataset+'> dataset, at <'+town+'> on <'+datetime+'>',
        "value": value[0]
    }
