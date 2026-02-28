#!/bin/bash

USER="attacker"

usermod -U $USER
echo "AR: Restored user $USER" >> /var/ossec/logs/active-responses.log

exit 0