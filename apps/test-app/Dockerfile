FROM golang:alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/test-app

FROM scratch


COPY --from=builder /go/bin/test-app /go/bin/test-app

ENTRYPOINT ["/go/bin/test-app"]
