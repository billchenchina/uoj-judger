FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

COPY src /opt/uoj/judger
COPY uoj_work_path.h /opt/uoj/judger/uoj_judger/include/
COPY .conf.json /opt/uoj/judger/
RUN \
apt-get -y update && \
apt-get -y install cmake fp-compiler python python3 python3-requests openjdk-8-jdk openjdk-11-jdk make g++ && \
useradd -m local_main_judger && usermod -a -G www-data local_main_judger && \
mkdir -p /var/uoj_data/upload && \
chown -R www-data:www-data /var/uoj_data && \
chown -R local_main_judger:local_main_judger /opt/uoj/judger && \
ln -s /var/uoj_data /opt/uoj/judger/uoj_judger/data && \
chmod +x /opt/uoj/judger/judge_client && \
cd /opt/uoj/judger/uoj_judger/ && make -j$(($(nproc) + 1))

COPY docker-entrypoint.sh /usr/local/bin
WORKDIR /opt/uoj/judger/
VOLUME /opt/uoj/judger/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/opt/uoj/judger/judge_client"]
