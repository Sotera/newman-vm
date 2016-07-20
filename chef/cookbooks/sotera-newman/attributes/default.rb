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
                                                          "scala" => "2.11.7",
                                                          "spark" => "1.5.2-hadoop2.3-1",
                                                          "mitie" => "20160306-1"
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