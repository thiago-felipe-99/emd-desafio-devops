import pytest
from src import create_app


@pytest.fixture
def app():
    app = create_app({
        'TESTING': True,
        'NAME': 'TESTING_DEV',
    })

    yield app


@pytest.fixture
def client(app):
    return app.test_client()


@pytest.fixture
def runner(app):
    return app.test_cli_runner()
