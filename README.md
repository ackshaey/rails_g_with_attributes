# [rails_g_with_attributes RubyGem](https://rubygems.org/gems/rails_g_with_attributes)

## Overview

This gem adds a `--with-attributes` option to the `rails g` command, specifically for the `rails g 
scaffold_controller` command. This is useful because by default the command doesn't generate the controller actions
and views / form fields for the fields that exist on the model. I find this particularly annoying because it pretty
much renders the generator useless for my needs, which were to build an admin interface for some select models. This
gem monkey patches `Rails::Generators::NamedBase` to looks for the the `--with_attributes` options and if present,
include the model fields automatically for the invoked generator. I haven't tested this for generators other than
`scaffold_controller`, so use at your own risk for anything else.

## Installation
Add the following to your Gemfile:

```ruby
group :development do
  # ...
  gem 'rails_g_with_attributes'
  # ...
end
```
## Publishing
1. Update the version in `rails_g_with_attributes.gemspec`
2. Generate a new version with `gem build rails_g_with_attributes.gemspec`
3. Push the new version to rubygems with `gem push rails_g_with_attributes-<version>.gem`
4. Update Github with the new version code

