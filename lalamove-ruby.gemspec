# frozen_string_literal: true

require_relative 'lib/lalamove/version'

Gem::Specification.new do |spec|
  spec.name          = 'lalamove'
  spec.version       = Lalamove::VERSION
  spec.authors       = ['ferreiraandy']
  spec.email         = ['andyferreira92@gmail.com']

  spec.summary       = 'A Lalamove ruby client'
  spec.description   = 'A Lalamove ruby client'
  spec.homepage      = 'https://https://github.com/petlove/lalamove-ruby'
  spec.license       = 'MIT'
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.4')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.add_dependency 'activesupport', '>= 5', '< 7'
  spec.add_dependency 'dry-struct', '~> 1.4.0'
  spec.add_dependency 'dry-types', '~> 1.5.1'

  spec.add_runtime_dependency 'awesome_print'
  spec.add_runtime_dependency 'faraday', '~> 1.1.0'

  spec.add_development_dependency 'bundler', '~> 2.1.4'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 1.7'
  spec.add_development_dependency 'rubocop-performance', '>= 1.4.1'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
end
