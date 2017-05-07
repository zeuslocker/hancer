# config valid only for current version of Capistrano
lock '3.8.0'

set :application, 'transport'
set :repo_url, 'git@ssh.hub.teamvoy.com:krhansen/transport.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :log_level, :debug

set :user, 'teamvoy'

set :use_sudo, false
set :ssh_options, {
  forward_agent: true
}

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_custom_path, '/opt/rbenv/'

# set :rvm_ruby_version, "#{File.read('.ruby-version').strip}@#{File.read('.ruby-gemset').strip}"
# set :tmp_dir, '/home/new-hair/tmp'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', '.env')

# Default value for linked_dirs is []
# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end

after 'deploy:publishing', 'deploy:restart'
after 'deploy:finishing', 'deploy:cleanup'
