FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy application files
COPY wisecow.sh /usr/local/bin/wisecow.sh
RUN chmod +x /usr/local/bin/wisecow.sh

# Create non-root user
RUN useradd -m -s /bin/bash wisecow
USER wisecow

# Expose port
EXPOSE 4499

# Start the application
CMD ["/usr/local/bin/wisecow.sh"]
