FROM ubuntu

# Define variables
ARG LSERVER
ARG OTG
# Set environment variables
ENV LABSERVER=$LSERVER
ENV OTG_BUILD=$OTG

# Set working directory and copy application files
WORKDIR /opt/ondatraOTG
COPY $OTG_BUILD $WORKDIR/
RUN chmod +x $WORKDIR/$OTG_BUILD
COPY entrypoint.sh $WORKDIR/
RUN cp /entrypoint.sh .
RUN cp /$OTG_BUILD .

#Define the default executable
ENTRYPOINT ["/entrypoint.sh"]

CMD tail -f /dev/null