require 'spec_helper'

describe "nginx_passenger::vhost" do
  context "normal vhost" do
    let(:title) { "static" }
    let(:params) {
      {:host => "static"}
    }

    context "base functionality" do
      it { should compile }

      it { should contain_file("static").with(path: "/opt/nginx/conf/sites-available/static") }
      it { should contain_file("static").with_content(/root \/var\/www\/static/) }
      it { should contain_file("/opt/nginx/conf/sites-enabled/static") }
    end
  end

  context "Rails vhost" do
    let(:title) { "railsapp" }
    let(:params) {
      {:rails => true, :host => "railsapp"}
    }

    it { should compile }
    it { should contain_file("railsapp").with(path: "/opt/nginx/conf/sites-available/railsapp") }
    it { should contain_file("railsapp").with_content(/root \/var\/www\/railsapp\/current\/public/) }
    it { should contain_file("/opt/nginx/conf/sites-enabled/railsapp") }
  end
end
