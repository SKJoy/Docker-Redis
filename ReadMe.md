# `Redis`
Docker based `Redis` server with `Redis Commander` management panel. Fully functional with `.env` file based customizations.

## Feature
- `Redis` server
- `Redis Commander` web based management UI
- User management with `Redis` **ACL**
- **Backup** automation script
- Persistent `Redis` data

## `Redis`
- Access is managed with **ACL** in the form of `username` & `password` pair
- Default `admin` user password is `password`
- Update current `admin` user password with **ACL**; check `How to` section below

## `Redis Commander`
- URL: `http://REDIS_COMMANDER_IP:REDIS_COMMANDER_HTTP_PORT/redis`
- Check `REDIS_COMMANDER_USER` & `REDIS_COMMANDER_PASSWORD` for access credentials

## How to
- ### `Redis`
    - **Start**: Execute `ReStart.sh` script or use `docker compose up -d` command
    - **Connection**: Check `REDIS_IP`, `REDIS_PORT` and **ACL** user credential
    - Add new **user**: `ACL SETUSER username ON >password ~* &* +@all`
    - Add **password** for **user**: `ACL SETUSER username ON >anotherpassword ~* &* +@all`
    - Change access for `defalt` **user**: Check `Configuration/user.acl` file
    - Save **user** credentials: `ACL SAVE` (important)
    - Prune **log**: Execute `ReStart.sh` script
    - Make available to **all networks** including **public**: Set `REDIS_IP` = `0.0.0.0`
- ### `Redis Commander`
    - Use reverse proxy to expose to external networks (suggested), otherwise change `REDIS_COMMANDER_IP` as needed
- ### Backup
    - Execute `Backup.sh` script
    - Will restart the Docker containers
    - Backup file will be created within the `Backup` folder
    - Use `Backup.sh` script with `Cron` for automated periodic backup
- ### Reset
    - Execute `Reset.sh` script
    - `Data` will be flushed
    - `Log` will be flushed
    - User **ACL** will not be reset
- ### Docker
    - Change internal **IP**: Check `DOCKER_NETWORK_PREFIX`; Do not add the 4th octek

## Reference
- `Redis` Docker image: `https://hub.docker.com/_/redis`
- `Redis` documentation: `https://redis.io/docs/latest/`
- `Redis Commander`: `https://github.com/joeferner/redis-commander`

