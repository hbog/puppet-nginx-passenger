require 'spec_helper_acceptance'

# make sure Ruby is really installed with Puppet RVM
# (there's many moving parts that can go wrong with this setup,
# integration wise, thus the acceptance test. RVM is a quick moving target
# and a failing test here may mean we have to update to the very latest puppet RVM
# version, or submit a issue report, do a PR for them OR it indicates an change upstream
# we need to adjust for)
describe "Installing Ruby via RVM" do
  it "installs the default version of Ruby for this package" do
    pp = <<-EOS
      class {'nginx_passenger':
          passenger_version => '4.0.23',
          installdir        => '/opt/nginx',
          logdir            => '/var/log/nginx',
          www               => '/var/www',
      }
    EOS

    expect(apply_manifest(pp).exit_code).to_not eq(1)
    expect(apply_manifest(pp).exit_code).to eq(0)  # test for idempotence

    expect(file("/usr/local/rvm/bin/rvm")).to be_a_file, "RVM was not installed, check Puppet RVM"

    # ... and check to make sure Ruby has been installed...
    ruby20_version = 'ruby-2.0.0-p247'
    shell("/usr/local/rvm/bin/rvm list") do |r|
      r.stdout.should =~ Regexp.new(Regexp.escape("\n=\* #{ruby20_version}"))  # yes, also check to make sure this is the current and default Ruby...
      r.exit_code.should be_zero
    end

    # AND that the passenger gem made it in...
    shell("/usr/local/rvm/bin/rvm #{ruby20_version} do gem list") do |gemlist_output|
      gemlist_output.stdout.should =~ /passenger /
      gemlist_output.exit_code.should be_zero
    end
  end

end



