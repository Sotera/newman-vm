execute "apt-get update"

node['sotera-newman']['default']['packages'].each do |pkg,ver|
  package pkg do
    if ver == "latest"
      action :upgrade
    else
      action ver
    end
    ignore_failure false
  end
end
