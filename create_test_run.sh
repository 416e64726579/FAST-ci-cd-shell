curl -X POST \
  https://us1.api.wallarm.com/v1/test_run \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 324' \
  -H 'Content-Type: application/json' \
  -H 'Host: us1.api.wallarm.com' \
  -H "X-WallarmAPI-UUID: $1" \
  -H "X-WallarmAPI-Secret: $2" \
  -H 'cache-control: no-cache' \
  -d '{
    "state": "paused",
    "name": "gitlab-ci",
    "desc": "GITLAB CI/CD",
    "rps": 20,
    "rps_per_baseline": 2,
    "tags": [],
    "policy_id": 68,
    "node_id": 10716,
    "skip_duplicated_baselines": true,
    "stop_on_first_fail": false,
    "inactivity_timeout": 1800,
    "type": "node",
    "clientid": 172
}'
