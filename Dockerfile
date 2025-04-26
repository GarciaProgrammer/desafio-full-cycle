FROM golang:1.22 as builder

WORKDIR /app

COPY . .

RUN go build -o fullcycle

FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]
