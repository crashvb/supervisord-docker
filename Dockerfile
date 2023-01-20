FROM crashvb/base:22.04-202301200005@sha256:bb2038f9dfd289a9b15004b09955c141826be6d7b46d44fa0e7cd2f71e2d02ad
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:bb2038f9dfd289a9b15004b09955c141826be6d7b46d44fa0e7cd2f71e2d02ad" \
	org.opencontainers.image.base.name="crashvb/base:22.04-202301200005" \
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
