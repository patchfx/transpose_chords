lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'transpose_chords/version'

Gem::Specification.new do |spec|
  spec.name          = "transpose_chords"
  spec.version       = TransposeChords::VERSION
  spec.authors       = ["Richard Patching"]
  spec.email         = ["richard@justaddpixels.com"]
  spec.description   = %q{Ruby lib for transposing chords}
  spec.summary       = %q{Ruby lib for transposing chords}
  spec.homepage      = "http://github.com/patchfx/transpose_chords"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '~> 1.3', '>= 1.3'
  spec.add_development_dependency "rake", '~> 10.5.0', '>= 10.5.0'
  spec.add_development_dependency "rspec", '~> 3.4.0', '>= 3.4.0'
  spec.add_development_dependency "pry", '~> 0.10.3', '>= 0.10.3'
end
