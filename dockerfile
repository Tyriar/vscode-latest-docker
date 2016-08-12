FROM debian:8

ENV DEBIAN_FRONTEND noninteractive  
RUN apt-get update
RUN apt-get install -y curl \
                       git \
                       libasound2 \
                       libcanberra-gtk-module \
                       libgconf2-4 \
                       libgl1-mesa-glx \
                       libgtk2.0-0 \
                       libnotify4 \
                       libnss3 \
                       libx11-dev \
                       libxtst6 \
                       sudo \
                       unzip
RUN rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -y nodejs build-essential

RUN mkdir /vscode
RUN curl -sL https://vscode-update.azurewebsites.net/latest/linux-x64/stable > /vscode/VSCode-linux-x64-stable.zip  
WORKDIR /vscode

RUN unzip VSCode-linux-x64-stable.zip && rm VSCode-linux-x64-stable.zip  
RUN adduser --disabled-login --uid 1000 \--gecos 'dummy' dummy

RUN mkdir /home/dummy/.config
RUN mkdir /home/dummy/.vscode
RUN chown -R dummy /home/dummy/.config
RUN chown -R dummy /home/dummy/.vscode

CMD ["sudo","-u","dummy","/vscode/VSCode-linux-x64/bin/code","--verbose"]
