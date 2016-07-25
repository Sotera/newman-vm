name             'banners'
maintainer       'digitalsynapse'
maintainer_email 'raparkhurst@digitalsynapse.io'
license          'All rights reserved'
description      'Installs/Configures system'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ ubuntu debian rhel centos amazon }.each do |os|
  supports os
end