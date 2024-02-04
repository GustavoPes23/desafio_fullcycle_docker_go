#STAGE 1
FROM golang:latest AS builder

WORKDIR /app

COPY . .

RUN go build ./main.go

#STAGE 2
FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

ENTRYPOINT [ "./main" ]

CMD [ "go" ]