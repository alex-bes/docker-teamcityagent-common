#!/bin/sh
echo "Updating property file..."

sed -i "s|serverUrl=http://localhost:8111/|serverUrl=$TEAMCITY_SERVER_URL|" /srv/teamcity-agent/conf/buildAgent.properties
sed -i "s|workDir=../work|workDir=/home/app/work|" /srv/teamcity-agent/conf/buildAgent.properties
sed -i "s|ownPort=9090|ownPort=$AGENT_PORT|" /srv/teamcity-agent/conf/buildAgent.properties
sed -i "s|name=|name=$AGENT_NAME|" /srv/teamcity-agent/conf/buildAgent.properties

echo "UPDATED:"
cat /srv/teamcity-agent/conf/buildAgent.properties

echo "============================================"

/srv/teamcity-agent/bin/agent.sh run