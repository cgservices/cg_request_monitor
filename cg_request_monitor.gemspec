Gem::Specification.new do |gem|
  gem.authors       = ['Luis Doubrava']
  gem.email         = ['luis@cg.nl']
  gem.description   = 'CG Request Monitor'
  gem.summary       = 'Gem to monitor requests'
  gem.homepage      = ''

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'cg_request_monitor'
  gem.require_paths = ['lib']
  gem.version       = "0.0.9"

  gem.add_dependency('rails', ['>= 3.0.0'])

  gem.add_development_dependency('rake', ['>= 0'])
  gem.add_development_dependency('rspec', ['>= 0'])
end