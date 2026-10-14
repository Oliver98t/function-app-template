import logging

import azure.functions as func
import pytest

from source.function_app import hello


def make_request() -> func.HttpRequest:
    return func.HttpRequest(
        method="GET",
        url="https://example.test/api/hello",
        body=b"",
    )


def test_hello_returns_success_response() -> None:
    response = hello(make_request())

    assert response.status_code == 200
    assert response.get_body() == b"Hello from Azure Functions!"


def test_hello_logs_request_and_completion(caplog: pytest.LogCaptureFixture) -> None:
    with caplog.at_level(logging.INFO, logger="source.function_app"):
        hello(make_request())

    assert "Handling hello request" in caplog.text
    assert "Hello request completed: status_code=200" in caplog.text