# postfix

SMTP server for use as an internet facing MTA. Set the timezone for logging via
`TZ` environment variables.

## Environment variables

- `TZ`: timezone used for logging, defaults to UTC

## Persistent volumes

- `/etc/postfix/main.cf`: main configuration - owner 0, group 0, mode 0644
- `/etc/postfix/master.cf`: service configuration - owner 0, group 0, mode 0644
- `/var/spool/postfix`: postfix working directory, run `/usr/sbin/postfix check` to initialize it - owner 0, group 0, mode 0755

## Network ports

- `25/tcp`: SMTP
- `465/tcp`: SMTPS
- `587/tcp`: SMTP STARTTLS submission
- `10025/tcp`: SMTP for filtered email

## Usage

```shell
make help
```
