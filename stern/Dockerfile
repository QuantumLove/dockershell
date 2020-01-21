FROM alpine:3.10

WORKDIR /stern

# TODO Should be downloaded with curl
COPY stern_linux_amd64 /stern/stern 

RUN adduser -D stern
USER stern

ENTRYPOINT ["/stern/stern"]
CMD ["help"]