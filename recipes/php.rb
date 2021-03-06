case node['platform_family']
when "rhel", "fedora", "suse"
  
  include_recipe "yum::epel"
  include_recipe "yum::remi"
  
  
  %w{php php-pecl-apc php-mysql php-mbstring php-ldap php-intl php-curl php-gd gawk php-xml php-xmlrpc php-pear}.each do |a_package|
    package a_package
  end

when "debian"
    apt_repository "php" do
      uri "http://packages.dotdeb.org/"
      distribution "wheezy"
      components ["all"]
      key "http://www.dotdeb.org/dotdeb.gpg"
    end
    include_recipe "apt::default"

    %w{php5 php5-dev php5-mysql php5-apc php5-intl php5-curl php5-gd gawk}.each do |a_package|
      package a_package
    end
end