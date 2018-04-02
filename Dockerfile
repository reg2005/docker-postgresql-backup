FROM postgres:10.2-alpine

ADD entrypoint.sh entrypoint.sh

ENTRYPOINT []

RUN chmod +x entrypoint.sh

CMD ["/entrypoint.sh"]