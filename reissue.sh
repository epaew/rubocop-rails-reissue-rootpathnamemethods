#!/bin/sh -ex

mkdir -p db
cat <<RUBY > db/seeds.rb
# frozen_string_literal: true

Dir.glob(Rails.root.join("db", "seeds", Rails.env, "*.rb")).sort.each do |file|
  load file
end
RUBY
bundle exec rubocop --debug --require rubocop-rails --only Rails/RootPathnameMethods db/seeds.rb
