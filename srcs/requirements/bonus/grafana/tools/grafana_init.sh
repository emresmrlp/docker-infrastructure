#!/bin/sh

set -e

export GF_SECURITY_ADMIN_PASSWORD="$(cat /run/secrets/grafana_password)"

exec "$@"