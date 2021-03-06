# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dreaming_god/version'

Gem::Specification.new do |spec|
  spec.name          = "dreaming_god"
  spec.version       = DreamingGod::VERSION
  spec.authors       = ["Rodney Degracia"]
  spec.email         = ["rdegraci@gmail.com"]

  spec.summary       = %q{An Alexa voice skill bridge to a database }
  spec.description   = %q{Manipulate a database using Amazon Alexa skill voice commands, eventually to be used to create syllogisms}
  spec.homepage      = "https://www.github.com/rdegraci/dreaming_god"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standalone_migrations", "~>5.0"
  spec.add_development_dependency "sqlite3", "~>1.3"
  spec.add_development_dependency "database_cleaner", "~>1.5"
  spec.add_dependency "alexagram", "~>1.0"
  spec.add_dependency "activerecord", "~>5.0"

end
