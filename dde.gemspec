require_relative "lib/dde/version"

Gem::Specification.new do |spec|
  spec.name        = "dde"
  spec.version     = Dde::VERSION
  spec.authors     = ["bryan-mw"]
  spec.email       = ["brianmsyamboza@gmail.com"]
  spec.homepage    = "https://github.com/orgs/Malawi-Ministry-of-Health/dde-plugin"
  spec.summary     = "DDE stands for Demographics Data Exchange. Its main purpose is to manage patient IDs."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/orgs/Malawi-Ministry-of-Health/dde-plugin"
  spec.metadata["changelog_uri"] = "https://github.com/orgs/Malawi-Ministry-of-Health/dde-plugin/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.8"
  spec.add_dependency "rest-client"

  spec.add_dependency "sqlite3"
end
