name             'sotera-newman'
maintainer       'Sotera Defense Solutions'
maintainer_email 'robert.parkhurst@soteradefense.com'
license          'All rights reserved'
description      'Installs/Configures sotera-newman'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "elasticsearch"
depends "docker"
depends "java"

%w{ ubuntu debian rhel centos amazon }.each do |os|
  supports os
end