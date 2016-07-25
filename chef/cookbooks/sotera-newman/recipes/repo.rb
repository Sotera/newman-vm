case node['platform_family']
  when 'debian'
    apt_repository 'digitalsynapse' do
      uri           'http://repo.digitalsynapse.io/apt'
      distribution  node['lsb']['codename']
      components    ['main']
      key           'http://repo.digitalsynapse.io/apt/pubkey.gpg'
      action        :add
    end
  when 'rhel'
end

