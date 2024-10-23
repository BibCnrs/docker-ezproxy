#!/bin/bash
echo -e "----------------------------------------------------------------"
echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] The container hostname is $HOSTNAME."
if [[ $HOSTNAME != *.* ]]
then
  echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] \e[33mYour HOSTNAME doesn't look like an  (Fully Qualified Domain Name).\e[39m"
  echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] \e[33mPass 'docker -h <hostname>' or define the hostname in your docker-compose.yml.\e[39m"
  echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] \e[91mEZproxy may not function correctly.\e[39m"
fi
echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] Generating missing files (if any) . . ."
/usr/local/ezproxy/ezproxy -m > /dev/null
cp config/$GATE_NAME/*.txt .
cp -r config/authorization .
cp -r config/ssl .
echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] \e[33mcp config $GATE_NAME done\e[39m"
if [ ! -f /usr/local/ezproxy/wskey.key ]
then
  echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] \e[33mwskey.key was not found in /usr/local/ezproxy/.\e[39m"
  if [ -z $EZ_PROXY_KEY ]
  then
    echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] \e[33mEZ_PROXY_KEY variable is blank or null.\e[39m"
    echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] \e[91mEZproxy may not function correctly.\e[39m"
  else
    echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] EZ_PROXY_KEY variable is set. Generate the WSKey . . ."
    /usr/local/ezproxy/ezproxy -k $EZ_PROXY_KEY
  fi
else
  echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] \e[92mwskey.key was found in /usr/local/ezproxy/.\e[39m"
  echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] EZproxy is presumed to be properly licensed."
  echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] This container does not check the validity of the WSKEY."
  echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] Please validate your EZproxy instance in the admin interface."
fi
echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] Starting EZproxy . . ."
echo -e "[$(date)] [\e[33mdocker-run.sh\e[39m] All logs below are from the EZproxy executable."
echo -e "----------------------------------------------------------------"
/usr/local/ezproxy/ezproxy