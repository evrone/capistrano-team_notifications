require 'capistrano'

module Capistrano
  module TeamNotifications
    def self.load_into(configuration)
      configuration.load do

        before 'deploy', 'team_notifications:started'
        before 'deploy:migrations', 'team_notifications:started'

        after 'deploy', 'team_notifications:finished'
        after 'deploy:migrations', 'team_notifications:finished'

        at_exit do
          # log = fetch(:full_log)

          # if log.include?("rolling back")
          #   team_notify "%{deployer} FAILED to deploy %{application}#{': '+branch if branch} to %{stage}"
          # end
        end

        namespace :team_notifications do
          task :started do
            team_notify "%{deployer} is deploying %{application}#{': '+branch if branch} to %{stage}"
          end

          task :finished do
            team_notify "%{deployer} successfully deployed %{application}#{': '+branch if branch} to %{stage}"
          end
        end

        def team_notify(message)
          deployer = fetch(:deployer,  `git config user.name`.chomp)
          stage = fetch(:stage, 'production')

          message = message % {deployer: deployer, application: application, stage: stage}

          nc_notify(message)
        end

        def nc_notify(message)
          raise "Undefined capistrano-team_notifications token" if team_notifications_token.empty? || team_notifications_token == ''

          http = Net::HTTP.new("space-notice.com", 443)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          http.post("/p/#{team_notifications_token}", "message=#{message}")
        rescue Net::ReadTimeout
        end

        def branch
          fetch(:branch, nil)
        end

      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::TeamNotifications.load_into(Capistrano::Configuration.instance)
end
