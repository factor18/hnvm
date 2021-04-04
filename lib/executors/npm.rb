require_relative '../node'

module HNVM
  module Executors
    class Npm
      def execute(args)
        node = HNVM::Node.new
        node.download unless node.exists?
        exec("#{node.path}/bin/npm #{args}")
      end
    end
  end
end

HNVM::Executors::Npm.new.execute(ARGV.join(" "))
