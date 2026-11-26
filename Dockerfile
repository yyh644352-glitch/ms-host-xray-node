FROM alpine:3.20
RUN apk add --no-cache curl unzip && \
    ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then XRAY_ZIP=Xray-linux-arm64-v8a.zip; else XRAY_ZIP=Xray-linux-64.zip; fi && \
    curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v25.10.15/${XRAY_ZIP} && \
    unzip /tmp/xray.zip -d /usr/local/bin/ && rm /tmp/xray.zip
COPY config.json /usr/local/etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]
