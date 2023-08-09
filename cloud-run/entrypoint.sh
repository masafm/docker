#!/bin/bash

#export DD_TRACE_DEBUG=true
DD_TRACE_DEBUG=true /app/datadog-init ddtrace-run python /app/app.py
