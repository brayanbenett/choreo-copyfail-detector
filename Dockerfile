# Use a lightweight Python base image
FROM python:3.11-slim

# Set the working directory
WORKDIR /scripts

# Copy the detector script into the container
COPY detect_copyfail.py .

# Create a standard, unprivileged user. 
# This is critical to simulate an actual attacker's starting point.
RUN useradd -ms /bin/bash choreouser
USER choreouser

# Execute the script when the container runs
ENTRYPOINT ["python3", "/scripts/detect_copyfail.py"]
