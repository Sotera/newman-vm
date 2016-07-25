name             'apt-repo'
maintainer       'Digital Synapse, LLC'
maintainer_email 'raparkhurst@digitalsynapse.io'
license          'All rights reserved'
description      'Installs/Configures apt-repo'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.0'


depends "bsw_gpg"
depends "nginx"
depends "users"


%w{ ubuntu debian  }.each do |os|
  supports os
end