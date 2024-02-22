#!/bin/bash

mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae61 < "sql/test.sql"

