# Set this to a branch name to copy down a binary directly from S3
default['travis_go_worker']['branch'] = ''

# Disables writing a new config, as with hosts configured via cloud-init
default['travis_go_worker']['disable_reconfiguration'] = false

# Docker image for worker itself; used when local docker is available
default['travis_go_worker']['docker_image'] = 'quay.io/travisci/worker:v2.3.1-61-g76a687b'

# Docker image => tag pairs to pull and tag prior to bringing travis-worker online
default['travis_go_worker']['warmed_docker_images'] = {}

# This should be the exact env vars
default['travis_go_worker']['environment'] = {}

default['travis_go_worker']['docker']['disable_install'] = false
default['travis_go_worker']['docker']['volume']['device'] = '/dev/xvdc'
default['travis_go_worker']['docker']['volume']['metadata_size'] = '2G'
default['travis_go_worker']['docker']['dm_basesize'] = '12G'
default['travis_go_worker']['docker']['dm_fs'] = 'xfs'
default['travis_go_worker']['docker']['dir'] = '/mnt/docker'

set['papertrail']['watch_files']['/var/log/upstart/travis-worker.log'] = 'travis-worker'

# rsyslogd must be root in order to read upstart logs :'(
set['rsyslog']['user'] = 'root'
set['rsyslog']['group'] = 'root'
set['rsyslog']['priv_seperation'] = false
