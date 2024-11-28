FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    jq \
    ca-certificates \
    python3 \
    python3-venv \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN echo '#!/bin/bash\n\
    REPO_URL="https://api.github.com/repos/MrDave/StaticJinjaPlus/tags"\n\
    LATEST_TAG=$(curl -s $REPO_URL | jq -r ".[0].name")\n\
    curl -L -o /tmp/app.tar.gz "https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/$LATEST_TAG.tar.gz"' \
    > /usr/local/bin/get_latest_tag.sh && chmod +x /usr/local/bin/get_latest_tag.sh

RUN /usr/local/bin/get_latest_tag.sh

RUN mkdir -p /opt/static_jinja_plus && \
    tar xzf /tmp/app.tar.gz --strip-components=1 -C /opt/static_jinja_plus && \
    rm /tmp/app.tar.gz

WORKDIR /opt/static_jinja_plus

RUN python3 -m venv venv && \
    ./venv/bin/pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["./venv/bin/python", "main.py"]
