require 'spec_helper'


describe "nginx_passenger" do
  context "base functionaly" do
    it { should compile }
  end

  context "proxy support for rvm_system_ruby" do
      let (:params) {{
          :ruby_version => 'ruby-2.0.0-p247',
          :proxy_url => 'http://proxy.example.net:80'
      }}
      it do
          should contain_rvm_system_ruby('ruby-2.0.0-p247').
              with(proxy_url: 'http://proxy.example.net:80') 
      end
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
