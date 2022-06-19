import uvicorn
from fastapi import FastAPI

app = FastAPI()

@app.on_event("startup")
async def startup_event():
    pass

@app.get("/temp/{dt}")
def get_temp(dt: str):
    return {
        "temperature": "55°C",
        "date time": dt
    }




if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=5400, reload=True)
