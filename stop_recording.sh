curl -X POST \
  https://us1.api.wallarm.com/v1/test_record/$3/action/stop \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: ' \
  -H 'Host: us1.api.wallarm.com' \
  -H "X-WallarmAPI-UUID: $1" \
  -H "X-WallarmAPI-Secret: $2" \
  -H 'cache-control: no-cache'
