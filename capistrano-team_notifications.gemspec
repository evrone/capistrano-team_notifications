# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/team_notifications/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-team_notifications"
  spec.version       = Capistrano::TeamNotifications::VERSION
  spec.authors       = ["Alexander Balashov"]
  spec.email         = ["divineforest@example.com"]
  spec.summary       = %q{Capistrano notifications for all team members via OSX Notification Center}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/evrone/capistrano-team_notifications"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1"
  spec.add_development_dependency "rake"
end
