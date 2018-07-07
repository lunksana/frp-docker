FROM alpine
LABEL mainintatner="lunksana <zoufeng4@gmail.com>"

RUN apk update && \
    apk add wget && \
    rm /var/cache/apk/* && \
    mkdir /frp && \
    cd /frp && \
    wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v0.20.0/frp_0.20.0_linux_amd64.tar.gz && \
    tar xzf *.tar.gz && \
    rm *.gz && \
    mkdir conf && \
    cd frp* && \
    cp frpc ../ && \
    cd ../ && \
    rm -rf frp_* && \
    apk del wget
VOLUME [ "/frp/conf" ]

ADD start.sh /frp
RUN chmod +x /frp/start.sh
ENTRYPOINT [ "/frp/start.sh" ]