# Usage: ./sub_enum.sh [host.com]

#!/bin/bash

# 1. curl 명령어
curl -s https://crt.sh\?q\=\%..$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe | tee -a ./out.txt
cat ./out.txt | unfurl --unique domains > crt.sh.txt
rm -rf ./out.txt

# 2. amass 명령어
/root/amass_linux_amd64/amass enum -passive -d $1 -o amass_result.txt

# 3. sonarsearch 명령어
crobat-client -s $1 >> sonarsearch_result.txt

# 4. subfinder 명령어
subfinder -d $1 -o subfinder_result.txt

# 5. assetfinder 명령어
assetfinder --subs-only $1 | tee –a ./assetfinder_result.txt

# 6. findomain 명령어
/root/findomain-linux -t $1 -o

# 7. 결과물을 취합하는 스크립트 작성
cat amass_result.txt assetfinder_result.txt $1.txt sonarsearch_result.txt subfinder_result.txt crt.sh.txt| unfurl --unique domains > all_scr.txt
#cat amass_result.txt assetfinder_result.txt $host_name.txt sonarsearch_result.txt subfinder_result.txt | sort | uniq > all_scr.txt

# 8. httpx 명령어
httpx -l all_scr.txt -title -content-length -status-code -o $1.httpx_all_status_result.txt

# 9. 200 status code
cat $1.httpx_all_status_result.txt | grep 200 | awk '{print $1}' | tee -a $1.httpx_200_result.txt
