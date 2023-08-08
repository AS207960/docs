#!/usr/bin/env bash

./venv/bin/mkdocs build
mc mirror --overwrite ./site garage/docs
