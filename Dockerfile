# Use a base image that suits your requirements, such as Ubuntu or Debian
FROM ubuntu:20.04

# Install necessary tools like curl and wget, as well as any dependencies for aaPanel
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Define the URL for the aaPanel install script
ENV AAPANEL_INSTALL_URL=https://www.aapanel.com/script/install_7.0_en.sh

# Download and run the aaPanel installation script
RUN if [ -f /usr/bin/curl ]; then \
      curl -ksSO "$AAPANEL_INSTALL_URL"; \
    else \
      wget --no-check-certificate -O install_7.0_en.sh "$AAPANEL_INSTALL_URL"; \
    fi \
    && bash install_7.0_en.sh aapanel

# Expose necessary ports for aaPanel
EXPOSE 8888 80 443

# Start aaPanel service (if necessary, adjust the starting script)
CMD ["bash"]
