require_relative '../node'

module HNVM
  module Executors
    class Node
      def execute(args)
        node = HNVM::Node.new
        node.download unless node.exists?
        exec("#{node.path}/bin/node #{args}")
      end
    end
  end
end

HNVM::Executors::Node.new.execute(ARGV.join(" "))
