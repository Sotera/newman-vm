default['sotera-newman']['default']['packages'] = case node['platform_family']
                                                    when 'debian'
                                                      {
                                                          "zip" => "latest",
                                                          "p7zip-full" => "latest",
                                                          "pkg-config" => "latest",
                                                          "python-pip" => "latest",
                                                          "python-dev" => "latest",
                                                          "htop" => "latest",
                                                          "iperf" => "latest",
                                                          "maven" => "latest",
                                                          "netcat" => "latest",
                                                          "git" => "latest",
                                                          "unzip" => "latest",
                                                          "screen" => "latest",
                                                          "emacs" => "latest",
                                                          "scala" => "2.11.7",
                                                          "spark" => "1.5.2-hadoop2.3-1",
                                                          "mitie" => "20160306-1",
                                                          "apt-transport-https" => "latest",
                                                          "ca-certificates" => "latest"
                                                      }
                                                    when 'rhel'
                                                      {
                                                          "emacs" => "latest",
                                                          "emacs-goodies-el" => "latest",
                                                          "emacs-window-layout" => "latest",
                                                          "vim" => "latest",
                                                          "openssh-server" => "latest",
                                                          "screen" => "latest"
                                                      }
                                                    else
                                                      {
                                                      }
                                                  end


default['sotera-newman']['limits']['user'] = "vagrant"
default['sotera-newman']['limits']['hard_limit'] = 65535
default['sotera-newman']['limits']['soft_limit'] = 65535
default['sotera-newman']['elasticsearch']['version'] = "2.0.0"
default['sotera-newman']['elasticsearch']['memory'] = "1g"
default['sotera-newman']['elasticsearch']['cluster_name'] = "ecluster"
default['sotera-newman']['elasticsearch']['node_name'] = "node01"
default['sotera-newman']['elasticsearch']['http_port'] = 9201


default['sotera-newman']['kibana']['server_host'] = "localhost"

default['sotera-newman']['python']['tangelo'] = "0.6.1"


default['sotera-newman']['newman']['git_repository'] = "https://github.com/Sotera/newman"
default['sotera-newman']['newman']['git_revision'] = "dev-multi-dataset-pilot"
default['sotera-newman']['newman']['git_destination'] = "/srv/software/newman"


default['sotera-newman']['newman_research']['git_repository'] = "https://github.com/Sotera/newman-research"
default['sotera-newman']['newman_research']['git_revision'] = "master"
default['sotera-newman']['newman_research']['git_destination'] = "/srv/software/newman-research-master"


default['sotera-newman']['pst_extraction']['git_repository'] = "https://github.com/Sotera/pst-extraction"
default['sotera-newman']['pst_extraction']['git_revision'] = "master"
default['sotera-newman']['pst_extraction']['git_destination'] = "/srv/software/pst-extraction-master"