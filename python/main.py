from sanic import Sanic
from sanic.response import json

app = Sanic('hello-python')

@app.route("/")
async def test(request):
    return json({"greetings": "Hello, Python!"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
