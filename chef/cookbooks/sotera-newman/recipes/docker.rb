execute "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D"


case node['platform_family']
  when 'ubuntu'
    apt_repository 'docker' do
      uri           'https://apt.dockerproject.org/repo'
      distribution  'ubuntu-trusty'
      components    ['main']
      #key           ''
      action        :add
    end
  when 'rhel'
end


package "docker-engine" do
  action :upgrade
end

docker_service 'default' do
  action [:create, :start]
end



# Pull and tag sotera/spark-local
docker_image 'sotera/spark-local:0.9' do
  action :pull_if_missing
end

docker_tag 'spark-local-tag' do
  target_repo 'sotera/spark-local'
  target_tag '0.9'
  to_repo 'localhost:5043/sotera/spark-local'
  to_tag 'latest'
  action :tag
end



# pull and tag sotera/geo-utils
docker_image 'sotera/geo-utils:0.9' do
  action :pull_if_missing
end

docker_tag 'sotera-geo-utils-tag' do
  target_repo 'sotera/geo-utils'
  target_tag '0.9'
  to_repo 'localhost:5043/sotera/geo-utils'
  to_tag 'latest'
  action :tag
end



# pull and tag sotera/apertium
docker_image 'sotera/apertium:0.9' do
  action :pull_if_missing
end

docker_tag 'sotera-apertium-tag' do
  target_repo 'sotera/apertium'
  target_tag '0.9'
  to_repo 'localhost:5043/sotera/apertium'
  to_tag 'latest'
  action :tag
end



# pull and tag sotera/ocr
docker_image 'sotera/ocr:0.9' do
  action :pull_if_missing
end

docker_tag 'sotera-ocr-tag' do
  target_repo 'sotera/ocr'
  target_tag '0.9'
  to_repo 'localhost:5043/sotera/ocr'
  to_tag 'latest'
  action :tag
end



# pull embed-map
docker_image 'lukewendling/embed-map' do
  action :pull_if_missing
end