import uvicorn
import pandas as pd
from fastapi import FastAPI

app = FastAPI()

def startup_event():
    return pd.read_pickle("forecast.pkl")

@app.get("/{town}/{ds}/{dt}")
def get_data(town: str, ds: str, dt : str):
    return {
        "Value": "55°C",
        "town": town,
        "dataset": ds,
        "date time": dt

    }




if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=5400, reload=True)
