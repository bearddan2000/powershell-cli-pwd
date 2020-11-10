FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y wget apt-transport-https software-properties-common \
    && wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && add-apt-repository universe \
    && apt-get install -y powershell

COPY bin/ .

RUN chmod +x ./main.ps1

CMD ["pwsh", "main.ps1"]
