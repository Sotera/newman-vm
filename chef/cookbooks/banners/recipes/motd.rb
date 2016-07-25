banners_item = data_bag_item('system','banners')

template "/etc/motd" do
  source "motd.erb"
  variables({
                :contents => banners_item['motd']
            })
  owner "root"
  group "root"
  mode "0755"
end
