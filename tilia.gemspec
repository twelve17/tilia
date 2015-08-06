# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tilia/version"

Gem::Specification.new do |s|
  s.name = "tilia"
  s.version = Tilia::VERSION

  s.platform    = Gem::Platform::RUBY
  #s.required_ruby_version = ">= 2.1.2"

  s.require_paths = ["lib"]
  s.authors = ["AP"]

  s.description = "Expose the java concurrent-trees library to JRuby."
  s.email = "nachos@cafebueno.org"
  s.licenses = ["MIT"]
  s.summary = "Expose concurrent-trees to JRuby."
  s.homepage = "https://code.google.com/p/concurrent-trees/"

  s.extra_rdoc_files = ["README.md"]
  #s.files = `git ls-files`.split("\n")
  s.files = Dir.glob("lib/**/*.rb")

  if RUBY_PLATFORM =~ /java/
    s.files << "lib/tilia/concurrent-trees.jar"
    s.files << "lib/tilia/ct.version"
  else
    raise "Only JRuby is supported at this time"
  end

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake-compiler', '~> 0.9'
  s.add_development_dependency 'minitest', '~> 5.5'
  s.add_development_dependency 'rdoc', '~> 4.2'
end

