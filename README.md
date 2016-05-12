Docker Mysql Discovery
======================

## Overview

Image of a mysql server with serf.

It exports the `/var/lib/mysql` folder inside the container, that it is where
the databases are stored. If that volume is shared with the container and there
are no databases, the container will create the initial databases and configure
the mysql root password using the envar `$MYSQL_ROOT_PASSWORD`.

## How to use it


## Quick help