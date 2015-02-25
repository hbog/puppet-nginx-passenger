# consul/spec/spec_helper_acceptance.rb
require 'beaker-rspec'
require 'mocha/setup'

hosts.each do |host|
  install_puppet

end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(:source => proj_root, :module_name => 'nginx_passenger')
    hosts.each do |host|
      on host, puppet('module', 'install', 'maestrodev/rvm'), { :acceptable_exit_codes => [0,1] }
    end
  end
end
