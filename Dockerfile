FROM enwaiax/peer2profit:alpine

COPY config.json /etc/xray/config.json
COPY xray.sh /xray.sh
RUN set -ex \
	&& apk add --no-cache tzdata ca-certificates \
	&& mkdir -p /var/log/xray /usr/share/xray \
	&& wget -O /usr/bin/xray https://dl.lamp.sh/files/xray_linux_amd64 \
	&& chmod +x /usr/bin/xray \
	&& wget -O /usr/share/xray/geosite.dat https://github.com/v2fly/domain-list-community/releases/latest/download/dlc.dat \
	&& wget -O /usr/share/xray/geoip.dat https://github.com/v2fly/geoip/releases/latest/download/geoip.dat \
        && chmod +x /xray.sh
	
ENV PATH /usr/bin/xray:$PATH
ENV PORT 80
ENV TZ=Asia/Shanghai
VOLUME /etc/xray
WORKDIR /etc/xray
ENTRYPOINT ["/xray.sh"]
CMD ["xray", "-config=/etc/xray/config.json"]
