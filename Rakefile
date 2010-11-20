PROJECT_NAME = "Expectacular"
CONFIGURATION = "Release"
SPECS_TARGET_NAME = "Specs"
UI_SPECS_TARGET_NAME = "UISpecs"
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
task :default => [:specs, :uispecs]

desc "Run on cruisecontrol"
task :cruise do
  Rake::Task[:clean].invoke
  Rake::Task[:specs].invoke
  Rake::Task[:uispecs].invoke
end

desc "Clean"
task :clean do
  stdout = File.join(ENV['CC_BUILD_ARTIFACTS'], "clean.output") if (ENV['IS_CI_BOX'])
  system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -alltargets -configuration #{CONFIGURATION} clean], stdout)
end

desc "Build specs"
task :build_specs do
  stdout = File.join(ENV['CC_BUILD_ARTIFACTS'], "build_specs.output") if (ENV['IS_CI_BOX'])
  system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -target #{SPECS_TARGET_NAME} -configuration #{CONFIGURATION} build], output_file("specs"))
end

desc "Build UISpecs"
task :build_uispecs do
  system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -target #{UI_SPECS_TARGET_NAME} -configuration #{CONFIGURATION} -sdk iphonesimulator3.2 ARCHS=i386 build], output_file("uispecs"))
end

desc "Build all"
task :build_all do
  stdout = File.join(ENV['CC_BUILD_ARTIFACTS'], "build_all.output") if (ENV['IS_CI_BOX'])
  system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -alltargets -configuration #{CONFIGURATION} build], stdout)
end

desc "Run specs"
task :specs => :build_specs do
  build_dir = build_dir("")
  ENV["DYLD_FRAMEWORK_PATH"] = build_dir
  system_or_exit("cd #{build_dir} && ./#{SPECS_TARGET_NAME}")
  puts("\n\n")
end

desc "Run UISpecs"
require 'tmpdir'
task :uispecs => :build_uispecs do
  `osascript -e 'tell application "iPhone Simulator" to quit'`
  
  ENV["DYLD_ROOT_PATH"] = SDK_DIR
  ENV["IPHONE_SIMULATOR_ROOT"] = SDK_DIR
  ENV["CFFIXED_USER_HOME"] = Dir.tmpdir
  ENV["CEDAR_HEADLESS_SPECS"] = "1"

  system_or_exit(%Q[#{File.join(build_dir("-iphonesimulator"), "#{UI_SPECS_TARGET_NAME}.app", UI_SPECS_TARGET_NAME)} -RegisterForSystemEvents]);
  puts("\n\n")
end