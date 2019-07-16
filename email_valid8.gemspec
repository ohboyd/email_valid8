Gem::Specification.new do |s|
  s.name        = 'email_valid8'
  s.version     = '0.0.1'
  s.license     = 'MIT'
  s.authors     = ['Michael Boyd', 'Gary Foster']
  s.email       = 'mikeallenboyd@gmail.com'
  s.date        = '2019-07-16'
  s.summary     = 'Easy mix-in for consistent email validation using built-in Ruby library.'
  s.description = 'This validator uses modern email validation with URI to handle the nuances of checking email \
                   throughout your application. Rather than customizing a bunch of random regex that you found \
                   on various stack overflow pages, this lets you include a single validator throughout your \
                   entire application. It can handle single emails, or even the odd case of multiple emails in a long \
                   string.'
  s.files       = ['lib/email_valid8.rb']
  s.require_paths = ['lib']

  s.add_dependency('activemodel', '~> 0')
  s.add_development_dependency('rake', '~> 0')
  s.add_development_dependency('rspec', '~> 0')
end
