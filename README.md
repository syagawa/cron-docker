# cron-docker

Run cron inside a docker container. You can change the command and execution time without `crontab -e`.

## start

1. git clone this repository
2. cd this repository
3. docker compose -f docker-compose-build.yml build
4. chmod +x ./cron/work/script.sh
5. docker compose -f docker-compose.yml up -d


## usage

After starting `docker compose -f docker-compose.yml logs -f`.
`cron/work/script.sh` will be executed every minute according to the settings of `cron/work/list` and "Test" will be displayed on the terminal.

When you rewrite `cron/work/list`, it will be evaluated after 1 minute and compared with the previous `cron/work/list` contents, and if it is different, change the cron settings in docker.


## example

By rewriting `/cron/work/list` as shown below, cron/work/script.sh was executed every minute, but now cron/work/other1.sh is executed every minute. Additionally, cron/work/other2.sh is executed every day at 1:01.

Note that other1.sh and other2.sh must be added to cron/work on the host machine.

```
# old cron/work/list
* * * * * /app/work/script.sh

# new cron/work/list
* * * * * /app/work/other1.sh
1 1 * * * /app/work/other2.sh
```
