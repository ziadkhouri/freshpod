FROM golang:1.16-alpine
COPY . /go/src/github.com/ziadkhouri/freshpod
WORKDIR /go/src/github.com/ziadkhouri/freshpod
RUN go install -v .

FROM alpine:3.14
COPY --from=0 /go/bin/freshpod /freshpod
ENTRYPOINT ["/freshpod"]
