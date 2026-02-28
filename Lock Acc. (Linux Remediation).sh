#!/bin/bash

USER="attacker"

usermod -L $USER
echo "AR: Locked user $USER due to escalation" >> /var/ossec/logs/active-responses.log

exit 0