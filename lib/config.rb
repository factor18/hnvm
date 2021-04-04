require 'os'
require 'logger'

$version = "0.0.1"
$assistant = "hnvm"

$identity = "#{$assistant}@#{$version}"

$log = Logger.new STDOUT
$log.level = Logger::DEBUG
$hnvm_path = File.expand_path("~/.hnvm")
$os_family = OS.linux? ? 'linux' : OS.mac? ? 'darwin' : 'unsupported'
