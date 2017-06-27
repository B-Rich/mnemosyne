# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mnemosyne/bot/version'

Gem::Specification.new do |spec|
  spec.name          = "mnemosyne"
  spec.version       = Mnemosyne::BOT::VERSION
  spec.authors       = ["Jelizondo"]
  spec.email         = ["jelizondo.s@icalialabs.com"]

  spec.summary       = %q{A Ruby Wrapper for IBM® Natural Language Understanding service.}
  spec.homepage      = "https://github.com/IcaliaLabs/Mnemosyne"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "olimpo", "~> 0.1.0"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
