name             'rackspace_graphite'
maintainer       'Rackspace'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'Apache 2.0'
description      'Installs and configures graphite'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

%w(ubuntu debian redhat centos).each do |os|
  supports os
end

depends  'python'
depends  'apache2'
depends  'runit', '~> 1.0'
depends  'memcached'

suggests 'systemd'
suggests 'graphiti'
suggests 'delayed_evaluator'
