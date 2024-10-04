# Use the official Golang image for building the app
FROM golang:1.19 as builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the entire project into the container
COPY . .

# Build the Go app
RUN go build -o /main

# Use a minimal base image to reduce size
FROM debian:buster-slim

# Copy the binary from the builder stage
COPY --from=builder /main /main

# Expose the port that the app will listen on
EXPOSE 8080

# Command to run the binary
CMD ["/main"]
