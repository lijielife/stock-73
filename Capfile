
I18n.enforce_available_locales = false
# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails/tree/master/assets
#   https://github.com/capistrano/rails/tree/master/migrations
#
# require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rbenv'
#set :git => 'git@github.com:capistrano/rbenv.git'
#set :ref => '67222bbce120323e422b051dcd167d8e2d3adbf0'
#set :rbenv_type, :user
#set :rbenv_type, :system
#set :rbenv_custom_path, '/home/owner/.rbenv'
set :rbenv_custom_path, '/usr/local/rbenv'
set :rbenv_ruby, '2.0.0-p353'
# require 'capistrano/chruby'
# 2014/1/12 capistrano-rbenv-2.0.0 depends on sshkit (~> 1.2.0)
# capistrano/rails/assets depends on sshkit (1.3.0)
# 2014/1/17 modify
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
#require 'capistrano/rails'


# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
