#!/bin/bash

# 환경세팅
sudo apt update && apt install -y jq unzip git zip

# 1. amass 설치
wget https://github.com/OWASP/Amass/releases/download/v3.7.4/amass_linux_amd64.zip
unzip amass_linux_amd64.zip

# 2. go 언어 설치 및 환경변수 설정
wget -nv https://dl.google.com/go/go1.13.6.linux-amd64.tar.gz;
sudo tar -C /usr/local -xzf go1.13.6.linux-amd64.tar.gz;
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:" >> "$HOME"/.profile;
echo "export GOPATH=$HOME/go" >> "$HOME"/.profile;
source "$HOME"/.profile;
rm -rf go1.13.6.linux-amd64.tar.gz;

# 3. sonarsearch 설치
go get github.com/cgboal/sonarsearch/crobat-client

# 4. subfinder 설치
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder

# 5. assetfinder 설치
go get -u github.com/tomnomnom/assetfinder

# 6. findomain 설치
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux

# 7. httpx 설치
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx

# 8. unfurl 설치
go get -u github.com/tomnomnom/unfurl
