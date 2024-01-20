#!/bin/sh
rm -f /app/work/temp
echo '* * * * * /app/update.sh' > /var/spool/cron/crontabs/root && crond -l 2 -f
