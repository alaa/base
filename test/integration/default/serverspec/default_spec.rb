require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = "/usr/local/rvm/gems/ruby-2.1.1/bin:/usr/local/rvm/gems/ruby-2.1.1@global/bin:/usr/local/rvm/rubies/ruby-2.1.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/rvm/bin"
  end
end

base_packages = %w(gettext make gcc libssl-dev curl libicu-dev
                libyaml-dev zlib1g-dev libreadline-dev autoconf 
                libmodule-build-perl libmodule-install-perl
                tcpdump iotop htop strace dnstracer vim nmap 
                screen sysstat tcpflow multitail lynx lsof 
                openssl libv8-dev bison libxml2-dev apache2-utils)

base_packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe package('ntp') do
  it { should be_installed }
end

describe service('ntp') do
  it { should be_running }
  it { should be_enabled }
end

describe command("ruby --version") do
  it { should return_stdout /ruby 2.1.1/ }
end
