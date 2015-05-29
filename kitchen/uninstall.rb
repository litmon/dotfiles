%w(epel-release nginx php55).each do |name|
  package name do
    action :remove
  end
end
