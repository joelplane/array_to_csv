# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "array_to_csv"
  spec.version       = "0.1.0"
  spec.authors       = ["Joel Plane"]
  spec.email         = ["joel.plane@gmail.com"]
  spec.description   = %q{Adds convenience method Array#to_csv for converting an array of hashes to CSV.}
  spec.summary       = %q{Convert array of hashes to CSV}
  spec.homepage      = "https://github.com/joelplane/array_to_csv"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
