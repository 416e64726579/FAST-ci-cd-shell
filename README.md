# SHELL CI/CD WALLARM FAST

<img src="https://docs.wallarm.com/images/wallarm_logo-en.svg?v=1" alt="drawing" width="130.320" height="63.424" />

This is a simple project provided as PoC of gitlab ci/cd with Wallarm [FAST] solution.

## Prerequisites

Properly configured Gitlab Runner:
* Docker network named "fast" with "bridge" driver
```bash
docker network create fast
```
* Configured volumes in config.toml
* Set up variable WALLARM_API_TOKEN in CI/CD settings (Not Protected)

*Note: you should properly configure the following parameters in create_test_run.sh*

```json	
    "name": <name> 
    "desc": <description>
    "rps": <rps>
    "rps_per_baseline": <rps_per_baseline>
    "tags": <tags>
    "policy_id": <policy_id>
    "node_id": <node_id>
    "clientid": <clientid>
```

### Example of config.toml
```toml
concurrent = 1
check_interval = 0

[session_server]
  session_timeout = 1800
[[runners]]
  name = "pipeline"
  url = "<url>"
  token = "<token>"
  executor = "docker"
  [runners.custom_build_dir]
  [runners.docker]
    tls_verify = false
    image = "docker:dind"
    privileged = true
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/var/run/docker.sock:/var/run/docker.sock", "/cache"]
    network_mode = "fast"
    shm_size = 0
  [runners.cache]
    [runners.cache.s3]
    [runners.cache.gcs]
```

## What does the script do?!

Entrypoint of a project is ***[e2e.sh]*** script which aggregates all the others

1. Start Test Run in paused state
2. Start FAST container
3. Send test requests by curl through FAST proxy to app (in our case it's an instanse of [Google Gruyere]) 
4. Stop recording baseline requests
5. Start running security tests on the target app
6. When tests passed stop and delete container FAST




[FAST]: <https://docs.fast.wallarm.com/>
[Google Gruyere]: <https://google-gruyere.appspot.com>
[e2e.sh]: <https://github.com/AndreyPetriv-Wallarm/FAST-ci-cd-shell/blob/master/e2e.sh>
