# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require('ogel/version')

Gem::Specification.new do |spec|
  spec.name          = 'ogel'
  spec.version       = Ogel::VERSION
  spec.authors       = ['Elliot Larson']
  spec.email         = ['elliot@onehouse.io']

  spec.summary       = 'Onehouse Git Helpers'
  spec.description   = 'Helpers for Git used at onehouse'
  spec.homepage      = 'https://onehouse.io'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set
  # the 'allowed_push_host' to allow pushing to a single host or delete
  # this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16.a'
  spec.add_development_dependency 'gist'
  spec.add_development_dependency 'pry', '~> 0.11.3'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'pry-coolline'
  spec.add_development_dependency 'pry-doc'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
