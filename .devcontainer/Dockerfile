ARG VARIANT

FROM mcr.microsoft.com/vscode/devcontainers/python:0-${VARIANT}

# Requires $POETRY_HOME to install the location; poetry is installed under /root by default.
ENV POETRY_HOME=/home/vscode/.local/share/pypoetry
ENV PATH="${POETRY_HOME}/bin:${PATH}"

RUN curl -sSL https://install.python-poetry.org | python3 -
