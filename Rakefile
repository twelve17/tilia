require 'rubygems'
require 'bundler/setup'

#require 'rdoc/task'
require 'rake/testtask'
require "bundler/gem_tasks"

GEMSPEC = Gem::Specification.load("tilia.gemspec")

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

def java?
  /java/ === RUBY_PLATFORM
end

if java?

  task :build_ct_dep do

    lib_dir = 'lib/tilia'
    ct_dir = "concurrent-trees-read-only"
    target_dir = File.join(ct_dir, "target")

    if File.exist? ct_dir
      puts "using existing concurrent-trees source"
    else
      puts "checking out concurrent-trees from googlecode (requires svn and mvn)"
      sh "svn checkout http://concurrent-trees.googlecode.com/svn/concurrent-trees/trunk/ #{ct_dir}"
      sh "cd #{ct_dir} && mvn package"
    end

    matches = Dir.glob("#{target_dir}/concurrent-trees-?.?.?-SNAPSHOT.jar")
    if matches.empty?
      raise "could not find concurrent-trees-*.jar in target"
    else
      if matches.first =~ /^#{ct_dir}\/target\/(concurrent-trees-\d+\.\d+\.\d+-SNAPSHOT\.jar)$/
        jar_name = $1

        File.open("#{lib_dir}/ct.version", 'wb') { |x| x << jar_name }
        puts "wrote version #{jar_name} to #{lib_dir}/ct.version file"

        cp "#{ct_dir}/target/#{jar_name}", "#{lib_dir}/concurrent-trees.jar"
        puts "copied #{jar_name} to #{lib_dir}/concurrent-trees.jar"
      else
        raise "could not extract concurrent-trees version from string: #{matches.first}"
      end
    end

    #Rake::Task[:build].enhance [:build_ct_dep]
    #task (:build).enhance [:build_ct_dep]
  end
end

task :default => [:clobber, :compile, :test]

