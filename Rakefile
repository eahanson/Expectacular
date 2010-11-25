PROJECT_NAME = "Expectacular"
CONFIGURATION = "Release"
SPECS_TARGET_NAME = "Specs"
SDK_DIR = "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.2.sdk"

def build_dir(effective_platform_name)
  File.join(File.dirname(__FILE__), "build", CONFIGURATION + effective_platform_name)
end

def system_or_exit(cmd, stdout = nil)
  puts "Executing #{cmd}"
  cmd += " >#{stdout} 2>&1" if stdout
  system(cmd) or raise "******** Build failed ********"
end

def output_file(target)
  output_dir = ENV['IS_CI_BOX'] ? ENV['CC_BUILD_ARTIFACTS'] : File.join(File.dirname(__FILE__), "build")
  output_file = File.join(output_dir, "build_#{target}.output")
  puts "Output: #{output_file}"
  return output_file
end

desc "Run all specs and uispecs"
task :default => [:specs]

desc "Run on cruisecontrol"
task :cruise do
  Rake::Task[:clean].invoke
  Rake::Task[:specs].invoke
end

desc "Clean"
task :clean do
  stdout = File.join(ENV['CC_BUILD_ARTIFACTS'], "clean.output") if (ENV['IS_CI_BOX'])
  system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -alltargets -configuration #{CONFIGURATION} clean], output_file("clean"))
end

desc "Build"
task :build => :gen do
  stdout = File.join(ENV['CC_BUILD_ARTIFACTS'], "build_all.output") if (ENV['IS_CI_BOX'])
  system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -alltargets -configuration #{CONFIGURATION} build], output_file("build"))
end

desc "Run specs"
task :specs => :build do
  build_dir = build_dir("")
  ENV["DYLD_FRAMEWORK_PATH"] = build_dir
  system_or_exit("cd #{build_dir} && ./#{SPECS_TARGET_NAME}")
  puts("\n\n")
end

desc "Generate code"
task :gen do
  require 'erb'
  ["m", "h"].each do |extension|
    @types = [
      { :type => "char",               :name => "char",             :converter => "%c", :exact => true }, 
      { :type => "int",                :name => "int",              :converter => "%d", :exact => true },
      { :type => "short",              :name => "short",            :converter => "%d", :exact => true },
      { :type => "long",               :name => "long",             :converter => "%d", :exact => true },
      { :type => "long long",          :name => "longLong",         :converter => "%d", :exact => true },
      { :type => "unsigned char",      :name => "unsignedChar",     :converter => "%u", :exact => true },
      { :type => "unsigned int",       :name => "unsignedInt",      :converter => "%u", :exact => true },
      { :type => "unsigned short",     :name => "unsignedShort",    :converter => "%u", :exact => true },
      { :type => "unsigned long",      :name => "unsignedLong",     :converter => "%u", :exact => true },
      { :type => "unsigned long long", :name => "unsignedLongLong", :converter => "%u", :exact => true },
      { :type => "float",              :name => "float",            :converter => "%f", :exact => false },
      { :type => "double",             :name => "double",           :converter => "%d", :exact => false }
    ]
    
    @matchers = [
      { :predicate => "return expected == actual;", :matcher => "toEqual",         :matcher_description => "to equal" },
      { :predicate => "return expected != actual;", :matcher => "toNotEqual",      :matcher_description => "to not equal" },
      { :predicate => "return expected < actual;",  :matcher => "toBeLessThan",    :matcher_description => "to be less than" },
      { :predicate => "return expected > actual;",  :matcher => "toBeGreaterThan", :matcher_description => "to be greater than" },
    ]

    output_file = "Classes/Expect.#{extension}"
    puts "Generating #{output_file}"
    File.open(output_file, 'w') {|f| f << ERB.new(IO.read("Templates/Expect.erb.#{extension}")).result(binding) }
  end
end
