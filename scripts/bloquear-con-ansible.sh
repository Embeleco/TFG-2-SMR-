#!/bin/bash
read INPUT
IP=$(echo $INPUT | grep -Po 'src_ip":\s*"\K[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -1)
ACTION=$(echo $INPUT | grep -Po 'command":\s*"\K[^"]+')

if [ ! -z "$IP" ]; then
 if [ "$ACTION" == "add" ]; then
  echo "$(date) - [BLOQUEO] Iniciando defensa contra IP: $IP" >> /var/ossec/logs/active-responses.log
  sudo -u izan /usr/bin/ansible-playbook -i /home/izan/inventory /home/izan/bloquear_ip.yml --extra-vars "ip_a_bloquear=$IP" >> /var/ossec/logs/active-responses.log 2>&1
 elif [ "$ACTION" == "delete" ]; then
  echo "$(date) - [DESBLOQUEO] Fin del tiempo de castigo para IP: $IP" >> /var/ossec/logs/active-responses.log
  sudo -u izan /usr/bin/ansible-playbook -i /home/izan/inventory /home/izan/desbloquear_ip.yml --extra-vars "ip_a_desbloquear=$IP" >> /var/ossec/logs/active-responses.log 2>&1
 fi
fi
