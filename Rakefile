require 'rake'
require 'rspec/core/rake_task'

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

ignore_paths = ['spec/**/*.pp', 'pkg/**/*.pp']

# necessary to ensure default :lint doesn't exist, else ignore_paths won't work
Rake::Task[:lint].clear

PuppetLint.configuration.relative = true
PuppetLint.configuration.disable_class_inherits_from_params_class
PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = ignore_paths
end
