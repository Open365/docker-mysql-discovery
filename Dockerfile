FROM mysql:5.6
MAINTAINER eyeos

ENV WHATAMI mysql
ENV MYSQL_MAX_CONNECTIONS 151

RUN \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get install -y curl && \
	curl -sL https://deb.nodesource.com/setup | bash - && \
	apt-get install -y \
		build-essential \
		git \
		nodejs \
		unzip \
		&& \
	curl -L https://releases.hashicorp.com/serf/0.6.4/serf_0.6.4_linux_amd64.zip -o serf.zip && \
	unzip serf.zip && \
	mv serf /usr/bin/serf && \
	rm serf.zip && \
	npm install -g \
		eyeos-run-server \
		eyeos-service-ready-notify-cli \
		eyeos-tags-to-dns \
		&& \
	npm cache clean && \
	npm uninstall npm && \
	apt-get clean && \
	apt-get -y remove --purge \
		curl \
		git \
		build-essential \
		&& \
	apt-get -y autoremove --purge && \
	rm -rf \
		/var/lib/apt/lists/* \
		/usr/share/doc \
		/usr/share/locales \
		/usr/share/man

COPY ["start.sh", "/tmp/"]

CMD ["/tmp/start.sh"]
