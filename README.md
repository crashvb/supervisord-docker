# supervisord-docker

## Overview

This docker image contains [supervisord](https:/supervisord.org/).

## Entrypoint Scripts

None.

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

