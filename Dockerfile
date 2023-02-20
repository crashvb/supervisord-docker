FROM crashvb/base:22.04-202302200203@sha256:92b673840a3108cf94c45c7cd755d164725fcdcb40e74c94c8432582039d8540
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:92b673840a3108cf94c45c7cd755d164725fcdcb40e74c94c8432582039d8540" \
	org.opencontainers.image.base.name="crashvb/base:22.04-202302200203" \
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
