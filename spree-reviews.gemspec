Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_reviews'
  s.version     = '0.50.1'
  s.summary     = 'Basic review and ratings facility for Spree'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Roman Smirnov'
  s.email             = 'roman@railsdog.com'
  s.homepage          = 'https://github.com/romul/spree-reviews/'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '>= 0.50.0')
  s.add_development_dependency('rspec-rails')
  s.add_development_dependency('spree')
  s.add_development_dependency('sqlite3')
end
