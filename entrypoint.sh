#!/bin/sh
exec  2>&1

# Updating the Service
update-service   --add    /et/sv/td-agent     td-agent
update-service   --add    /et/sv/td-agent-ui  td-agent-ui

exec  /usr/bin/runsvdir -P /etc/sv
