FROM golang:alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/simpleserver

FROM scratch


COPY --from=builder /go/bin/simpleserver /go/bin/simpleserver

ENTRYPOINT ["/go/bin/simpleserver"]
