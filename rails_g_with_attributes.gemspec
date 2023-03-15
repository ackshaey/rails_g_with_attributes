Gem::Specification.new do |spec|
  spec.name = "rails_g_with_attributes"
  spec.version = "1.0.3"
  spec.authors = ["Ackshaey Singh"]
  spec.email = ["ackshaey@gmail.com"]
  spec.summary = %q{Patches rails g to accept a --with_attributes options, used for the `rails g scaffold_controller` generator}
  spec.description = %q{This is a patch that modifies the rails g scaffold_controller generator to accept a --with_attributes option. The --with_attributes option is used to read model attributes if none are specified on the command line. This is a way to simplify the process of generating code by automatically including all of the attributes of the model when generating controller actions and views.}
  spec.license = "MIT"
  spec.homepage    = "https://github.com/ackshaey/rails_g_with_attributes"
  spec.files = Dir["lib/**/*"]
  spec.require_paths = ["lib"]
  spec.add_dependency "rails", ">= 5.0.0"
end