FROM ubuntu:latest



RUN apt-get update && apt-get install -y \
    python3-venv \
    python3-distutils \
    python3.10 \
    python3-pip \
    git

RUN apt-get update && apt-get install -y python3-venv python3-distutils
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
RUN pip install PyYAML


COPY feed.py /usr/bin/feed.py

COPY entrypoints.sh /entrypoints.sh

ENTRYPOINT ["/entrypoint.sh"]
