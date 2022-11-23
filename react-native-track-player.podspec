require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name = package["name"]
  s.version = package["version"]
  s.summary = package["description"]
  s.license = package["license"]

  s.author    = "David Chavez"
  s.homepage  = package["repository"]["url"]
  s.platforms = { :ios => "11.0", :tvos => "11.0" }
  
  s.source = { :git => package["repository"]["url"], :tag => "v#{s.version}" }
  s.source_files = "ios/**/*.{h,m,swift}"

  s.swift_version = "4.2"

  s.dependency "React-Core"
  s.dependency "SwiftAudioEx", "0.15.3"
end
