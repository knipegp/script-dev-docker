FROM hadolint/hadolint:v1.17.5-6-gbc8bab9 as builder
FROM knipegp/docker-base:0.0.1

USER root
WORKDIR /root

COPY --from=builder /bin/hadolint /usr/bin/hadolint

RUN apt-get update && apt-get install -y --no-install-recommends \
    shellcheck=0.4.6-1 \
    && rm -rf /var/lib/apt/lists/*

USER developer
WORKDIR /home/developer

ENV PATH="~/.local/bin:${PATH}"
