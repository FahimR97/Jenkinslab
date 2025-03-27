#!/bin/bash
python app.py &
nginx -g 'daemon off;'