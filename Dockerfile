FROM alpine
LABEL mainintatner="lunksana <zoufeng4@gmail.com>"
ARG FRP_VR=0.20.0

RUN apk add wget && \
    rm /var/cache/apk/* && \
    mkdir /frp && \
    cd /frp && \
    wget --no-check-certificate "https://github.com/fatedier/frp/releases/download/v${FRP_VR}/frp_${FRP_VR}_linux_amd64.tar.gz" && \
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