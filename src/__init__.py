"""
Just a simple hello-world app.
"""
from flask import Flask


def create_app(test_config=None):
    app = Flask(__name__)

    if test_config is None:
        app.config.from_pyfile("settings.py")
    else:
        app.config.from_mapping(test_config)

    @app.route("/")
    def hello_world():
        return f"Hello, {app.config.get('NAME')}!"

    return app
