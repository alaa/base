case node['platform_family']
when "debian", "ubuntu"
  default['base']['packages'] = %w(gettext make gcc libssl-dev curl libicu-dev
                                   libyaml-dev zlib1g-dev libreadline-dev autoconf 
                                   libmodule-build-perl libmodule-install-perl
                                   tcpdump iotop htop strace dnstracer vim nmap 
                                   screen sysstat tcpflow multitail lynx lsof 
                                   openssl libv8-dev bison libxml2-dev apache2-utils)
when "redhat", "centos", "fedora"
  default['base']['packages'] = %w()
end

default['rvm']['default_ruby']      = "ruby-2.1.1"
default['rvm']['rubies']            = ["ruby-2.1.1"]
