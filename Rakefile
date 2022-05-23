namespace :test do
  desc 'Run tests for ReadabilityModifier'
  task :package do
    sh 'rm -rf Tests/Artifacts'
    sh 'xcodebuild test -scheme ReadabilityModifier -destination "platform=iOS Simulator,name=iPhone 13 Pro,OS=15.2" -resultBundlePath Tests/Artifacts/ReadabilityModifierTests.xcresult'
  end
end