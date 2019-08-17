# supervisord-docker

## Overview

This docker image contains [supervisord](https://supervisord.org/).

## Entrypoint Scripts

None.

## Healthcheck Scripts

### supervisord

The embedded healthcheck script is located at `/etc/healthcheck.d/supervisord` and performs the following actions:

1. Verifies that the supervisord control socket is responds to requests.

## Commonly Used Commands

### Reload supervisord configuration

```bash
pkill --signal=SIGHUP supervisord
```

### Reopen supervisord logs

```bash
pkill --signal=SIGUSR2 supervisord
```

## Standard Configuration

### Container Layout

```
/
└─ etc/
   ├─ healthcheck.d/
   │  └─ supervisord
   └─ supervisor/
      ├─ config.d/
      │  └─ supervisord.conf
      └─ supervisord.conf
```

### Exposed Ports

None.

### Volumes

None.

## Development

[Source Control](https://github.com/crashvb/supervisord-docker)

