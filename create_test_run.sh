curl -X POST \
  https://api.wallarm.ru/v1/test_run \
  -H 'Content-Type: application/json' \
  -H 'Host: api.wallarm.ru' \
  -H 'X-WallarmAPI-Token: '"$1"'' \
  -H 'cache-control: no-cache' \
  -d '{
    "state": "paused",
    "name": "gitlab-ci",
    "desc": "GITLAB CI/CD",
    "rps": 20,
    "rps_per_baseline": 2,
    "tags": [],
    "policy_id": 5,
    "node_id": 170,
    "skip_duplicated_baselines": true,
    "stop_on_first_fail": false,
    "inactivity_timeout": 1800,
    "type": "node",
    "clientid": 16
}'

