# Set the current app's path for later reference. Rails.root isn't available at
# # this point, so we have to point up a directory.
app_path = File.expand_path(File.dirname(__FILE__) + '/..')

# The number of worker processes you have here should equal the number of CPU
# # cores your server has.
worker_processes (ENV['RAILS_ENV'] == 'production' ? 1 : 1)

# You can listen on a port or a socket. Listening on a socket is good in a
# # production environment, but listening on a port can be useful for local
# # debugging purposes.
# listen app_path + '/tmp/unicorn.sock', backlog: 64
#
# # For development, you may want to listen on port 3000 so that you can make sure
# # your unicorn.rb file is soundly configured.
# listen(3000, backlog: 64) if ENV['RAILS_ENV'] == 'development'


# After the timeout is exhausted, the unicorn worker will be killed and a new
# # one brought up in its place. Adjust this to your application's needs. The
# # default timeout is 60. Anything under 3 seconds won't work properly.
#timeout 600

timeout 60
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"
stderr_path "#{shared_dir}/log/unicorn.stderr.log"
stdout_path "#{shared_dir}/log/unicorn.stdout.log"
