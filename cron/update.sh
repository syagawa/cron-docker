#!/bin/sh

# not exists list
if [ ! -e /app/work/list ]; then
  echo '* * * * * /app/update.sh' > /var/spool/cron/crontabs/root
  touch /etc/crontabs/cron.update
  rm -f /app/work/temp
  touch /app/work/temp
  exit 0
fi


touch /app/work/temp
diff /app/work/temp /app/work/list > /dev/null 2>&1
if [ $? -eq 1 ]; then
  echo '* * * * * /app/update.sh' > /var/spool/cron/crontabs/root
  cat /app/work/list >> /var/spool/cron/crontabs/root
  touch /etc/crontabs/cron.update
  cat /app/work/list > /app/work/temp
fi
