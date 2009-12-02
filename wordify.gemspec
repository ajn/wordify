Gem::Specification.new do |s|
  s.name = 'wordify'
  s.version = "0.1.1"
  s.date = '2009-12-01'

  s.summary     = 'Covert Numerics into words'
  s.description = 'Covert Numerics into words'

  s.authors = ["Alex Neill"]
  s.email    = 'alex@featureless.co.uk'
  s.homepage = 'http://github.com/ajn/wordify'

  s.files = [ 'README.rdoc',
              'lib/wordify.rb',
              'lib/wordify/token.rb',
              'lib/wordify/token/hundreds.rb',
              'lib/wordify/token/tens.rb',
              'lib/wordify/token/unit.rb',
              'lib/wordify/constructor.rb',
              'lib/wordify/tokeniser.rb' ]

  s.require_paths = ['lib']

  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc']
  
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Wordify", "--main", "README.rdoc"]
end
