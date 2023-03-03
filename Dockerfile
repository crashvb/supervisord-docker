FROM crashvb/base:22.04-202303031605@sha256:ffa63321cadb7fdc937508b2976c6f919576bcbe93122a27fded24343d818315
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:ffa63321cadb7fdc937508b2976c6f919576bcbe93122a27fded24343d818315" \
	org.opencontainers.image.base.name="crashvb/base:22.04-202303031605" \
	org.opencontainers.image.created="${org_opencontainers_image_created}" \
	org.opencontainers.image.description="Base image containing supervisord." \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.source="https://github.com/crashvb/supervisord-docker" \
	org.opencontainers.image.revision="${org_opencontainers_image_revision}" \
	org.opencontainers.image.title="crashvb/supervisord" \
	org.opencontainers.image.url="https://github.com/crashvb/supervisord-docker"

# Install packages, download files ...
RUN docker-apt supervisor

# Configure: supervisor
COPY supervisord.conf /etc/supervisor/conf.d/10supervisord.conf

# Configure: healthcheck
COPY healthcheck.supervisord /etc/healthcheck.d/supervisord

CMD ["/usr/bin/supervisord", "--configuration=/etc/supervisor/supervisord.conf"]
