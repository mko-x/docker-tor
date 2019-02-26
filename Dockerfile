FROM alpine:latest
LABEL maintainer="Markus Kosmal <dev@m-ko.de>"

ENV RELAY_TYPE middle

ENV RELAY_PORT 9001
ENV RELAY_BANDWIDTH_RATE 400000 KBytes
ENV RELAY_BANDWIDTH_BURST 1000000 KBytes

RUN apk --no-cache add bash \
    tor \
	util-linux

RUN export UUID=`uuidgen`

ENV CONTACT_NAME tor_relay-${UUID}
ENV CONTACT_EMAIL ${UUID}-e@no.org

EXPOSE 9001

COPY types/torrc.bridge /etc/tor/torrc.bridge
COPY types/torrc.middle /etc/tor/torrc.middle
COPY types/torrc.exit /etc/tor/torrc.exit

COPY bootstrap.sh /bootstrap.sh
RUN chmod ugo+rx /bootstrap.sh

RUN chown -R tor /etc/tor

USER tor

RUN mkdir /var/lib/tor/.tor
VOLUME /var/lib/tor/.tor
RUN chown -R tor /var/lib/tor/.tor

ENTRYPOINT [ "/bootstrap.sh" ]