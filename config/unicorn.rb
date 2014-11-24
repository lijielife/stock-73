worker_processes 2
listen '/tmp/unicorn.sock'
pid "/var/www/stock/shared/tmp/pids/unicorn.pid"

stderr_path File.expand_path('unicorn.log', File.dirname(__FILE__) + '/../log')
stdout_path File.expand_path('unicorn.log', File.dirname(__FILE__) + '/../log')

preload_app true
