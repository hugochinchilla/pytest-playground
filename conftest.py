import sys

def pytest_configure() -> None:
    sys.path.append('src')
