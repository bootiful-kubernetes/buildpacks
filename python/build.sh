#!/usr/bin/env bash
#pack build -B gcr.io/buildpacks/builder:v1 python-asyncio-web
pack build -B heroku/buildpacks:18 python-asyncio-web
