case node["platform"]
when "debian", "ubuntu"
  default['base']['packages'] = %w(gettext make gcc libssl-dev curl libicu-dev
                                   libyaml-dev zlib1g-dev libreadline-dev autoconf 
                                   libmodule-build-perl libmodule-install-perl
                                   tcpdump iotop htop strace dnstracer vim)
when "redhat", "centos", "fedora"
  default['base']['packages'] = %w()
end
