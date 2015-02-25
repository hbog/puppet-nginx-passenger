require 'spec_helper'


describe "nginx_passenger" do
  context "base functionaly" do
    it { should compile }
  end

  context "configuring nginx" do
    let :facts do
      {osfamily: 'Debian'}
    end

    it { should contain_service("nginx") }
  end

  context "with a specified install dir" do
    let :params do
      { :installdir => "/srv/www/nginx" }
    end

    it { should contain_file("nginx-config").with(path: "/srv/www/nginx/conf/nginx.conf") }
    it { should contain_file("proxy-config").with(path: "/srv/www/nginx/conf/proxy.conf") }
  end
end
