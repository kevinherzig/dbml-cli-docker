# Start from Debian base
FROM debian:bookworm-slim

# Avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and Node.js 24
RUN apt-get update && \
    apt-get install -y curl gnupg ca-certificates bash && \
    curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install mc vim nano -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install DBML CLI globally
RUN npm install -g @dbml/cli

# Start an interactive shell by default
CMD ["bash"]

