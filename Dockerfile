FROM alpine

# Define variables
ARG LSERVER
ARG OTG

# Set environment variables
ENV LABSERVER=$LSERVER
ENV OTG_BUILD=$OTG

# Install required packages
RUN apk update && \
    apk add --no-cache curl psmisc jq --upgrade bash && \
    rm -rf /var/lib/apt/lists/*

# Set working directory and copy application files
WORKDIR /opt/ondatraOTG
COPY $OTG_BUILD $WORKDIR/
RUN chmod +x $WORKDIR/$OTG_BUILD
COPY entrypoint.sh $WORKDIR/
RUN chmod +x $WORKDIR/entrypoint.sh
RUN cp /entrypoint.sh .
RUN cp /$OTG_BUILD .

#Define the default executable
ENTRYPOINT ["sh", "/opt/ondatraOTG/entrypoint.sh"]

CMD tail -f /dev/null