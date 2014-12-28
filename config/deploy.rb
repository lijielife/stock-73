#アプリケーション名
set :application, 'stock'
#レポジトリURL
set :repo_url, 'git@github.com:peanuts2013/stock.git'
#対象ブランチ masterに固定
set :branch, :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

#デプロイ先ディレクトリ フルパスで指定
#set :deploy_to, '/var/www/stokc'
#2014/1/11 Capistrano3 -> fatch use
set :deploy_to, "/var/www/#{fetch(:application)}"
#バージョン管理方法 subverion, git, mercurial, cvs, bzrなど
set :scm, :git
# set :format, :pretty
#情報レベル info or debug
set :log_level, :info
#sudoに必要 これをtrueにするとssh -tで実行される
set :pty, true

#sharedに入るものを指定
# set :linked_files, %w{config/database.yml}
#set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}

#capistrano用bundleするのに必要
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
#5回分のreleasesを保持する
set :keep_releases, 5
#set :keep_releases, 20

# 2014/1/4 add
#require 'capistrano/puma'
#set :ssh_options, {
#  keys: [File.expand_path('~/.ssh/id_rsa')],
#  keys: [File.expand_path('/home/owner/Documents/demo-key.pem')],
#  forward_agent: true,
#  auth_methods: %w(publickey)
#}

# 2013/1/15 add
#set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }
#set :default_environment, {
#  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
#}
# rbenv setting
#require 'capistrano-rbenv'
#set :rbenv_ruby_version, '2.0.0-p353'
#set :rbenv_ruby, '2.0.0-p353'
#set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
#set :rbenv_map_bins, %w{rake gem bundle ruby rails}
#set :rbenv_roles, :all # default value
#set :rbenv_custom_path, '/usr/local/rbenv'
#set :rbenv_custom_path, '/home/owner/.rbenv'

#set :default_environment, {
#  'RBENV_ROOT' => "#{rbenv_path}",
#  'PATH' => "#{rbenv_path}/shims:#{rbenv_path}/bin:$PATH"
#}

namespace :deploy do
  # 2014/12/27 add
  namespace :assets do

    Rake::Task['deploy:assets:precompile'].clear_actions
    
    desc "Precompile assets"
    task :precompile do
      puts "-----nothing-------"
    end
  end

  desc 'Restart application'
  task :restart do
    # 2014/1/4 modify
#    on roles(:app), in: :sequence, wait: 5 do
#      invoke 'puma:restart'
     invoke 'unicorn:restart' #lib/capustrano/tasks/unicorn.cap内処理を実行
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
  end

#  after :restart, :clear_cache do
#        on roles(:web), in: :groups, limit: 3, wait: 10 do
#          # Here we can do anything such as:
#          within release_path do
#            execute :rmdir, '-rf', release_path.join('tmp/cache')
#          end
#        end
#  end

  # 2014/12/06 add
  after 'deploy:publishing', 'deploy:restart'

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
#      within release_path do
#        execute :rake, 'cache:clear'
#        execute :rake, 'assets:precompile'
#      end
    end
  end

#  after :finishing, 'deploy:cleanup'
end


#  after :restart, :clear_cache do
#    on roles(:web), in: :groups, limit: 3, wait: 10 do
#      # Here we can do anything such as:
#     within release_path do
#       execute :rake, 'cache:clear'
#        execute :rake, 'assets:precompile'
#      end
#    end
#  end

#after "deploy:update_code", :precompile_assets
#  desc "precompile the assets"
#  task :precompile_assets, :roles => :app do
#    run "cd #{release_path} && RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
#  end

#after :finishing, 'deploy:cleanup'

# 2014/1/4 modify
#end #L33 comment out unlock -> comment out

#namespace :assets do
#    task :precompile, :roles => :web, :except => { :no_release => true } do
#      from = source.next_revision(current_revision)
#      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
#        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
#      else
#        logger.info "Skipping asset pre-compilation because there were no asset changes"
#      end
#    end
#end