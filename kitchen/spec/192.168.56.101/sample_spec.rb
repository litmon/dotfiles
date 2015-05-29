require 'spec_helper'

describe package("nginx") do
  it { should be_installed }
end

describe package("php") do
  it { should be_installed }
end

describe port(22) do
  it { should be_listening }
end
