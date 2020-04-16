FROM minio/minio:RELEASE.2020-04-15T19-42-18Z

# Add user dokku with an individual UID
RUN adduser -D -u 32767 -g dokku dokku
USER dokku

# Create data directory for the user, where we will keep the data
RUN mkdir -p /home/dokku/data

# Minio uses TCP Port 9000
EXPOSE 9000/tcp

# Run the server and point to the created directory
CMD ["server", "/home/dokku/data"]
