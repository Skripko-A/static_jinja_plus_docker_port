FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-venv \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/static_jinja_plus

WORKDIR /opt/static_jinja_plus

ADD https://github.com/MrDave/StaticJinjaPlus/archive/refs/heads/main.tar.gz /tmp/app.tar.gz

RUN tar xzf /tmp/app.tar.gz --strip-components=1 -C /opt/static_jinja_plus && rm /tmp/app.tar.gz

RUN python3 -m venv venv

RUN ./venv/bin/pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["./venv/bin/python", "main.py"]