#!/bin/bash

#limiter le nombre de connexions http
ufw limit 80

#reload
ufw --force reload
ufw status verbose
