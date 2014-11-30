#worker_processes 2
#working_directory "#{app_path}/current/"
#listen '/tmp/unicorn.sock'
#listen '/var/www/stock/shared/tmp/sockets/unicorn.sock'
#pid "/var/www/stock/shared/tmp/pids/unicorn.pid"

#stderr_path File.expand_path('unicorn.log', File.dirname(__FILE__) + '/../log')
#stdout_path File.expand_path('unicorn.log', File.dirname(__FILE__) + '/../log')

#preload_app true


# coding: utf-8
app_path = '/var/www/stock'
app_shared_path = "#{app_path}/shared"

worker_processes 5

# 実態は symlink。
# SIGUSR2 を送った時にこの symlink に対して
# Unicorn のインスタンスが立ち上がる
working_directory "#{app_path}/current/"

listen "#{app_shared_path}/tmp/sockets/unicorn.sock"

stdout_path "#{app_shared_path}/log/unicorn.stdout.log"
stderr_path "#{app_shared_path}/log/unicorn.stderr.log"

pid "#{app_shared_path}/tmp/pids/unicorn.pid"

# ダウンタイムをなくす
preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end