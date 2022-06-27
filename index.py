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

def spliter(town):
    """
    Split the town who are containing the special character '-'
    """
    reformed = ""
    if "-" in town:
        reformed = town.split("-")
        reformed = [t.capitalize() for t in reformed]
        reformed = " ".join(reformed)
        return reformed
    return town.capitalize()

@app.route('/')
def home():
    """
    API V2
    Show the default format of the principal ENDPOINT
    """
    return {"response": "THE API ENDPOINT format is /<town>/<datetime> "}

def _get(d, town, ds, dt):
    row_date = d[ d["date"] == dt+" 00:00:00" ]
    row_town = row_date[row_date["town"] == spliter(town)]
    row_dataset = row_town[row_town["dataset"] == ds]
    return row_dataset["ValueF"].values[0]


@app.route('/<town>/<datetime>') #<>
def _data(town, datetime):
    """
    grab data the forecast model
    """

    forecast = load_forecast()
    d = forecast


    result = [ _get(d, town, x, datetime) for x in ["temp", "precip", "solar"] ]

    return {
        "response": 'The data for <'+town+'> on <'+datetime+'>',
        "values": result
    }
