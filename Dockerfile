FROM marpteam/marp-cli:latest
# FROM marpteam/marp-cli:v0.17.4

ENV LANG ja_JP.UTF-8

# Marpのサーバーモード起動のために設定
# EXPOSEは公開を宣言するだけで、マッピングはされない
EXPOSE 8080 37717
