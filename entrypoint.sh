#!/bin/sh
exec  2>&1

exec  /usr/sbin/td-agent-ui start
exec  /opt/td-agent/embedded/bin/ruby  /usr/sbin/td-agent  --log /var/log/td-agent/td-agent.log
