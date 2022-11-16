FROM ubuntu:16.04
RUN useradd -ms /bin/bash escape
WORKDIR /home/escape
COPY escapeRoom escapeRoom
COPY initEscapeRoom.sh . 
RUN chmod +x initEscapeRoom.sh && ./initEscapeRoom.sh
RUN rm initEscapeRoom.sh
COPY readme.txt /home/escape/escapeRoom
COPY readme.txt /etc/motd
RUN echo "cat /etc/motd" >> /home/escape/.bashrc
USER escape
WORKDIR /home/escape/escapeRoom
ENTRYPOINT ["bash"]

