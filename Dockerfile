FROM alpine:3.11
LABEL Maintainer="Sivakumar Vunnam"
RUN apk add --no-cache curl jq
COPY entrypoint.sh /entrypoint.sh
RUN chmod 775 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
