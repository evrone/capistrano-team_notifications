# Capistrano::TeamNotifications

This gem sends notifications for all team members via [Space notifications](https://space-notice.com/) and OSX Notification Center.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-team_notifications'

or if you use Capistrano v2

    gem 'capistrano-team_notifications', '~> 2'

And then execute:

    $ bundle

## Usage

First go to [Space notifications](https://space-notice.com/), create project like 'Facebook deploy' and get project token.

Add to Capfile

```ruby
require 'capistrano/team_notifications'
```

add to deploy.rb file

```ruby
set :team_notifications_token, "HERE_YOUR_SPACE_NOTIFICATIONS_TOKEN"
```

And finally give this link

    https://space-notice.com/auth/github?token=TOKEN

to your team members and ask them to open it in Safari 7 or above.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/capistrano-team_notifications/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
