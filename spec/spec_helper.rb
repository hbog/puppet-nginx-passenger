require 'puppetlabs_spec_helper/module_spec_helper'
require 'mocha/api'

RSpec.configure do |c|
c.hiera_config = File.expand_path(File.join(__FILE__, '../fixtures/hiera.yaml'))
end