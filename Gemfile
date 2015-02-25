source ENV['GEM_SOURCE'] || 'https://rubygems.org'

def location_for(place, fake_version = nil)
  if place =~ /^(git:[^#]*)#(.*)/
    [fake_version, { :git => $1, :branch => $2, :require => false }].compact
  elsif place =~ /^file:\/\/(.*)/
    ['>= 0', { :path => File.expand_path($1), :require => false }]
  else
    [place, { :require => false }]
  end
end

group :test do
  gem 'rake'
  gem 'puppet', *location_for(ENV['PUPPET_LOCATION'] || '~> 3.7.0')
  gem 'puppetlabs_spec_helper'
  gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem 'metadata-json-lint'
  gem 'beaker'
  gem 'beaker-rspec'
  gem 'rspec-puppet-facts'
end

