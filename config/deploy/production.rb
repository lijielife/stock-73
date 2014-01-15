set :stage, :production
set :rails_env, 'production'
set :migration_role, 'db'

set :application, 'stock'
# 2014/1/4 comment out
#cap puma:start  # => /etc/init.d/puma start stock

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
#role :app, %w{ec2-54-199-136-43.ap-northeast-1.compute.amazonaws.com}
#role :web, %w{ec2-54-199-136-43.ap-northeast-1.compute.amazonaws.com}
#role :db,  %w{ec2-54-199-136-43.ap-northeast-1.compute.amazonaws.com}
# 2014/1/7 modify
server 'ec2-54-199-133-27.ap-northeast-1.compute.amazonaws.com', roles: %w(app), user: 'ec2-user', ssh_options: {
#  keys: [File.expand_path('~/.ssh/...')]
  keys: [File.expand_path('/home/owner/Documents/demo-key.pem')]
}
server 'ec2-54-199-133-27.ap-northeast-1.compute.amazonaws.com', roles: %w(web), user: 'ec2-user', ssh_options: {
#  keys: [File.expand_path('~/.ssh/...')]
  keys: [File.expand_path('/home/owner/Documents/demo-key.pem')]
}
server 'ec2-54-199-133-27.ap-northeast-1.compute.amazonaws.com', roles: %w(db), user: 'ec2-user', ssh_options: {
#server 'stock-production.cy5iyxtaokjt.ap-northeast-1.rds.amazonaws.com', roles: %w(db), user: 'ec2-user', ssh_options: {
#  keys: [File.expand_path('~/.ssh/...')]
  keys: [File.expand_path('/home/owner/Documents/demo-key.pem')]
}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
#server 'stock.com', user: 'deploy', roles: %w{web app}, my_property: :my_value
server 'ec2-54-199-133-27.ap-northeast-1.compute.amazonaws.com', user: 'ec2-user', roles: %w{web app db}

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :production)
