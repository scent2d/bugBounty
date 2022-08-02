#!/bin/bash
# ubuntu 20.04 

apt update && apt upgrade -y && apt install -y jq zip unzip wget;

wget https://go.dev/dl/go1.18.5.linux-amd64.tar.gz;
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.5.linux-amd64.tar.gz;
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:" >> "$HOME"/.profile;
echo "export GOPATH=$HOME/go" >> "$HOME"/.profile;
source "$HOME"/.profile;
rm -rf go1.18.5.linux-amd64.tar.gz;
go version;

apt install -y python3-pip;

snap install amass;

go install -v github.com/tomnomnom/assetfinder@latest;

go install -v github.com/tomnomnom/anew@latest;

wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux;
chmod +x findomain-linux;
mv ./findomain-linux /usr/local/bin/findomain-linux;
findomain-linux -V;

go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest;
dnsx -version;

go install -v github.com/bp0lr/gauplus@latest;
gauplus -version;

go install github.com/deletescape/goop@latest;

go install -v github.com/hakluke/hakcheckurl@latest;

git clone https://github.com/guelfoweb/knock.git;
cd knock;
pip3 install -r requirements.txt;
python3 knockpy.py -v;
cd ~;

git clone https://github.com/s0md3v/Photon.git;
cd Photon;
pip3 install -r requirements.txt;
python3 photon.py
cd ~;

go install github.com/tomnomnom/meg@latest;

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest;
subfinder -version;

go install github.com/tomnomnom/waybackurls@latest;

git clone --recursive https://github.com/screetsec/Sudomy.git;
cd Sudomy;
pip3 install -r requirements.txt;
./sudomy;
cd ~;

pip3 install uro

go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest;
nuclei;

go install github.com/takshal/freq@latest;

go install github.com/j3ssie/sdlookup@latest;

git clone https://github.com/vortexau/dnsvalidator.git;
cd dnsvalidator;
python3 setup.py install;
dnsvalidator -h;
cd ~;

git clone https://github.com/blechschmidt/massdns.git;
cd massdns;
make;
make install;

go install github.com/d3mondev/puredns/v2@latest;
# https://wordlists.assetnote.io/ wordlist download

git clone https://github.com/hueristiq/hqurlfind3r.git && \
cd hqurlfind3r/cmd/hqurlfind3r/ && \
go build; mv hqurlfind3r /usr/local/bin/ && \
hqurlfind3r -h;

go install github.com/ferreiraklet/airixss@latest;

go install github.com/ferreiraklet/nilo@latest;