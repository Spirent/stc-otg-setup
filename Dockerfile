FROM alpine

# Define variables
ARG LSERVER
ARG OTG
ARG WORKDIR=/opt/ondatraOTG

# Set environment variables
ENV LABSERVER=$LSERVER
ENV OTG_BUILD=$OTG

# Install required packages
RUN apk update && \
    apk add --no-cache curl psmisc jq --upgrade bash && \
    rm -rf /var/lib/apt/lists/*

# Set working directory and copy application files
WORKDIR $WORKDIR
COPY $OTG_BUILD $WORKDIR/
RUN chmod +x $WORKDIR/$OTG_BUILD
COPY entrypoint.sh $WORKDIR/
RUN chmod +x $WORKDIR/entrypoint.sh

#Define the default executable
SHELL ["/bin/sh", "-c"]

ENTRYPOINT ["sh", "/opt/ondatraOTG/entrypoint.sh"]

CMD tail -f /dev/null
