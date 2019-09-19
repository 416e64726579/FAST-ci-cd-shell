docker run -d --rm --name fast --env-file=env.conf -e WALLARM_API_TOKEN=$WALLARM_API_TOKEN --network="fast" wallarm/fast
