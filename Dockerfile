
FROM alpine:latest
RUN apk --no-cache add git npm bash nodejs

WORKDIR /app

# # Create react user so container doesn't run with root permissions
# RUN addgroup -S react && adduser -S react -G react && \
#     mkdir -p /app && chown -R react:react /app

# Copy contents of local src directory in repo into the /app WORKDIR of the container
COPY src /app/

RUN npm cache clean --force && \
  npm install

# USER react

EXPOSE 3000

# Command on container startup to start node server and listen on Port 3000
#Change the command below for react app
CMD npm run start
