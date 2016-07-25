banners_item = data_bag_item('system','banners')

template "/etc/issue" do
  source "issue.erb"
  variables({
                :contents => banners_item['issue']
            })
  mode "0755"
  owner "root"
  group "root"
end


template "/etc/issue.net" do
  source "issue.erb"
  variables({
                :contents => banners_item['issue_net']
            })
  mode "0755"
  owner "root"
  group "root"
end