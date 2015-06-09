# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/sebastian/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-sebastian"
  spec.version       = Ruboty::Sebastian::VERSION
  spec.authors       = ["yukita"]
  spec.email         = ["yukiyakonkon1024@gmail.com"]

  spec.summary       = %q{セバスチャンbotを追加します。}
  spec.description   = %q{朝の挨拶、東京ドームのスケジュール、定時のお知らせをしてくれるセバスチャンbotを追加します。}
  spec.homepage      = ""

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty"
  spec.add_dependency "settingslogic"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

end
