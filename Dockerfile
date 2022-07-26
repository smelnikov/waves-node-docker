FROM wavesplatform/wavesnode

RUN apt -qq update; apt -qq upgrade; apt -qq -y install wget
RUN wget https://github.com/wavesplatform/Waves/releases/download/v1.4.7/waves-grpc-server_1.4.7_all.deb
RUN dpkg -i waves-grpc-server_1.4.7_all.deb

EXPOSE 6881
