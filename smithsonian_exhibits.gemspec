
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "smithsonian_exhibits/version"

Gem::Specification.new do |spec|
  spec.name          = "smithsonian_exhibits"
  spec.version       = SmithsonianExhibits::VERSION
  spec.authors       = ["ijanett"]
  spec.email         = ["ijanettmejia@outlook.com"]

  spec.summary       = %q{"Get exhibit info listed by floor, category or exhibit name."}
  spec.description   = %q{"User is able to get Smithsonian Museum Exhibit information, by choosing from a list of exhibits within the provided options (floor, category, all)."}
  spec.homepage      = "https://github.com/ijanett/smithsonian_exhibits"
  spec.license       = "MIT"
  
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "nokogiri", "~> 1.10"
  spec.add_dependency "colorize", "~> 0.8"
  spec.add_dependency "pry"
end
