# Stage 1: Build stage
FROM python:3.12-slim AS build

# Set working directory
WORKDIR /app

# Copy the application code
COPY app.py /app/

# Stage 2: Runtime stage
FROM python:3.12-alpine AS runtime

# Set working directory
WORKDIR /app

# Copy the application code from the build stage
COPY --from=build /app/app.py /app/

# Define the default command to run the application
CMD ["python", "app.py"]
