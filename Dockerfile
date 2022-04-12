FROM crashvb/base:20.04-202201080422@sha256:57745c66439ee82fda88c422b4753a736c1f59d64d2eaf908e9a4ea1999225ab
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:57745c66439ee82fda88c422b4753a736c1f59d64d2eaf908e9a4ea1999225ab" \
	org.opencontainers.image.base.name="crashvb/base:20.04-202201080422" \
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
