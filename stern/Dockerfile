FROM linuxbrew/linuxbrew:1.9.3

RUN brew install stern

RUN adduser -D stern

WORKDIR /stern
USER stern
ENTRYPOINT ["stern"]
CMD ["help"]