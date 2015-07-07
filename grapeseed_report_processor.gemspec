# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grapeseed_report_processor/version'

Gem::Specification.new do |spec|
  spec.name          = "grapeseed_report_processor"
  spec.version       = GrapeseedReportProcessor::VERSION
  spec.authors       = ["Jeremy Baker"]
  spec.email         = ["jhubert@gmail.com"]

  spec.summary       = %q{Processes insertion order values out of DBM report files}
  spec.description   = %q{Processes insertion order values out of DBM report files}

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["grapeseed_report_processor"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "simplecov", "~> 0.7.1"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
end
