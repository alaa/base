require_relative '../spec_helper'

describe 'base::default' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  packages = %w(gettext make gcc libssl-dev curl libicu-dev libyaml-dev 
                zlib1g-dev libreadline-dev autoconf libmodule-build-perl 
                libmodule-install-perl tcpdump iotop htop strace dnstracer 
                vim)

  packages.each do |pkg|
    before { stub_command("dpkg-query -s #{pkg}").and_return(false) }

    it "should install #{pkg}" do
      expect(subject).to install_package pkg
    end
  end
end
