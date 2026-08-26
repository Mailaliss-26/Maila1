# ---- Stage 1: Build ----
FROM gcc:13 AS builder

WORKDIR /app
COPY 1.cpp .

RUN g++ -O2 -o app 1.cpp

# ---- Stage 2: Runtime ----
FROM debian:bookworm-slim

WORKDIR /app
COPY --from=builder /app/app .

CMD ["./app"]
