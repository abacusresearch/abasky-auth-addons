FROM alpine:3.9

# import themes
COPY themes /themes

# install providers
COPY providers /providers
