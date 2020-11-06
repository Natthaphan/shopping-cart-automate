
FROM golang:1.15.3-alpine3.12 AS builder
WORKDIR /src
COPY . .
RUN  go mod download
# COPY . .
RUN go build -o app cmd/main.go

FROM alpine:3.12
WORKDIR /root/
COPY --from=builder /src/app .
CMD ["./app"]