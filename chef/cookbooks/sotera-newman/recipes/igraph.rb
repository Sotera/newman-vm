# install igraph repo
case node['platform_family']
  when 'debian'
    apt_repository 'igraph' do
      uri           'http://ppa.launchpad.net/igraph/ppa/ubuntu'
      distribution  node['lsb']['codename']
      components    ['main']
      key           'http://ppa.launchpad.net/igraph/ppa/ubuntu/dists/trusty/Release.gpg'
      action        :add
    end
  when 'rhel'
end



