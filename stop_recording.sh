curl -X POST \
  https://api.wallarm.ru/v1/test_record/$2/action/stop \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: ' \
  -H 'Host: api.wallarm.ru' \
  -H 'X-WallarmAPI-Token: '"$1"'' \
  -H 'cache-control: no-cache'

