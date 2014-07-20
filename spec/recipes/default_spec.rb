require_relative '../spec_helper'

describe 'base::default' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  packages = %w(gettext make gcc libssl-dev curl libicu-dev
                libyaml-dev zlib1g-dev libreadline-dev autoconf 
                libmodule-build-perl libmodule-install-perl
                tcpdump iotop htop strace dnstracer vim nmap 
                screen sysstat tcpflow multitail lynx lsof 
                openssl libv8-dev bison libxml2-dev apache2-utils)

  packages.each do |pkg|
    before :each do 
      stub_command("dpkg-query -s #{pkg}").and_return(false)
    end

    it "should install #{pkg}" do
      expect(subject).to install_package pkg
    end
  end

  it "should include ntp::default recipe" do
    expect(subject).to include_recipe 'ntp::default'
  end
end
