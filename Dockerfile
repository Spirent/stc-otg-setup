FROM ubuntu

ARG LSERVER
ENV LABSERVER=$LSERVER

# Set working directory and copy application files
WORKDIR /opt/ondatraOTG
COPY otgservice.V1.0.*.sh $WORKDIR/
RUN chmod +x $WORKDIR/otgservice.V1.0.*.sh
COPY entrypoint.sh $WORKDIR/
RUN cp /entrypoint.sh . 
RUN cp /otgservice.V1.0.*.sh .

ENTRYPOINT ["/entrypoint.sh"]

CMD tail -f /dev/null

