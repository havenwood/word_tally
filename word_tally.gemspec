# frozen_string_literal: true

require_relative 'lib/word_tally/version'

Gem::Specification.new do |spec|
  spec.name = 'word_tally'
  spec.version = WordTally::VERSION
  spec.authors = ['Shannon Skipper']
  spec.email = ['shannonskipper@gmail.com']

  spec.summary = 'Tallies the count of words from a file or streamed input.'
  spec.description = 'Output a tally of the number of times unique words appear in file or stdin source.'
  spec.homepage = 'https://github.com/havenwood/word_tally'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.3.0'

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) || f.start_with?(*%w[test/ .git .github Gemfile Rakefile])
    end
  end

  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
