ARG BASE_IMAGE=ubuntu:latest

FROM ${BASE_IMAGE}

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-venv \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/static_jinja_plus

WORKDIR /opt/static_jinja_plus

ADD --checksum=sha256:3555bcfd670e134e8360ad934cb5bad1bbe2a7dad24ba7cafa0a3bb8b23c6444 https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.0.tar.gz /tmp/app.tar.gz

RUN tar xzf /tmp/app.tar.gz --strip-components=1 -C /opt/static_jinja_plus && rm /tmp/app.tar.gz

RUN python3 -m venv venv

RUN ./venv/bin/pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["./venv/bin/python", "main.py"]