# Sample verbose configuration file for Unicorn (not Rack)
#
# This configuration file documents many features of Unicorn
# that may not be needed for some applications. See
# http://unicorn.bogomips.org/examples/unicorn.conf.minimal.rb
# for a much simpler configuration file.
#
# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.

# WARNING: See config/application.rb under "Relative url support" for the list of
# other files that need to be changed for relative url support
#
# ENV['RAILS_RELATIVE_URL_ROOT'] = "/gitlab"

# Read about unicorn workers here:
# http://doc.gitlab.com/ee/install/requirements.html#unicorn-workers
#
worker_processes 2

# Since Unicorn is never exposed to outside clients, it does not need to
# run on the standard HTTP port (80), there is no reason to start Unicorn
# as root unless it's from system init scripts.
# If running the master process as root and the workers as an unprivileged
# user, do this to switch euid/egid in the workers (also chowns logs):
# user "unprivileged_user", "unprivileged_group"

APP_ROOT = "/home/teamvoy/transport/staging/current/"

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory APP_ROOT # available in 0.94.0+

# Listen on both a Unix domain socket and a TCP port.
# If you are load-balancing multiple Unicorn masters, lower the backlog
# setting to e.g. 64 for faster failover.
listen APP_ROOT + 'tmp/sockets/unicorn.socket', backlog: 1024

timeout 30

# feel free to point this anywhere accessible on the filesystem
pid APP_ROOT + 'tmp/pids/unicorn.pid'

# By default, the Unicorn logger will write to stderr.
# Additionally, some applications/frameworks log to stderr or stdout,
# so prevent them from going to /dev/null when daemonized here:
stderr_path APP_ROOT + 'log/unicorn.stderr.log'
stdout_path APP_ROOT + 'log/unicorn.stdout.log'

# combine Ruby 2.0.0dev or REE with "preload_app true" for memory savings
# http://rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
preload_app true

# Enable this flag to have unicorn test client connections by writing the
# beginning of the HTTP headers before calling the application.  This
# prevents calling the application for connections that have disconnected
# while queued.  This is only guaranteed to detect clients on the same
# host unicorn runs on, and unlikely to detect disconnects even on a
# fast LAN.
check_client_connection false

before_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
end

after_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
end
