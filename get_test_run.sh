curl -X GET \
  https://api.wallarm.ru/v1/test_run/$2 \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Host: api.wallarm.ru' \
  -H 'X-WallarmAPI-Token: '"$1"'' \
  -H 'cache-control: no-cache'

