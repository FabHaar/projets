#!/bin/bash
echo "Machines sur lequelles Jean Neymar a fait de la maintenance :"
mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 < r11.sql 2> /dev/null
