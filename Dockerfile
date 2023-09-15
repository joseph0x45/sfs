# Use the official Golang image
FROM golang:latest AS builder

# Set the working directory
WORKDIR /app

# Copy the Go application and static files
COPY * /app/
# COPY static /app/static/

# Build the Go application
RUN go build -o sfs

# Use a lightweight base image
FROM alpine:latest

# Set the working directory
WORKDIR /root/

# Copy the built executable from the builder stage
COPY --from=builder /app/sfs .

# Expose the port the application runs on
EXPOSE 8080

# Run the application
CMD ["./sfs"]
