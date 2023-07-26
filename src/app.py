"""
Just a simple hello-world app.
"""

from flask import Flask


app = Flask(__name__)

app.config.from_pyfile("settings.py")


@app.route("/")
def hello_world():
    return f"Hello, {app.config.get('NAME')}!"


if __name__ == "__main__":
    app.run()
