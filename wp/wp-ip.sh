#!/bin/bash
echo $(dig +short myip.opendns.com @resolver1.opendns.com)
cp /etc/wordpress/config-mxbit.dynu.net.php /etc/wordpress/config-$(dig +short myip.opendns.com @resolver1.opendns.com).php
echo "/etc/wordpress/config-$(dig +short myip.opendns.com @resolver1.opendns.com).php"
echo "$(dig +short myip.opendns.com @resolver1.opendns.com)" >> /etc/wordpress/changelog

