$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "saved_searches/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "saved_searches"
  s.version     = SavedSearches::VERSION
  s.authors     = "Matthew Wilson"
  s.email       = "matthew.wilson@microbac.com"
  s.homepage    = "http://www.microbac.com"
  s.summary     = "This module creates a model that allows users to save their queries on any model in the application."
  s.description = "This module creates a model that allows users to save their queries on any model in the application."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  #s.add_dependency "rails", "~> 3.0.7"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
