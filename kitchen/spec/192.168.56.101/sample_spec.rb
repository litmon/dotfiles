require 'spec_helper'

describe package("epel-release") do
  it { should be_installed } 
end

describe package("remi-release-7.0-1.el7.remi.noarch") do
  it { should be_installed }
end

describe package("nginx") do
  it { should be_installed }
end

describe package("php55") do
  it { should be_installed }
end

describe file("/etc/nginx/nginx.conf") do
  it { should be_file }
  its(:content) { should match /root\s+\/var\/www\// }
end

describe port(22) do
  it { should be_listening }
end
