package "epel-release"

execute "Add repository remi to rpm" do
  command "rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm"
end

package "nginx"
package "php55" do
  action :install
  options "--enablerepo=remi --enablerepo=remi-php55"
end

service "nginx" do
  action [:enable, :start]
end

template "/etc/nginx/nginx.conf" do
  source "templates/nginx.conf"
  variables(root: "/var/www/")
  notifies :reload, "service[nginx]"
end
