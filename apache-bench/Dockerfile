FROM debian:stable-slim
RUN apt update -y && apt install -y apache2-utils curl && apt clean
COPY entrypoint.sh ./
CMD ./entrypoint.sh
