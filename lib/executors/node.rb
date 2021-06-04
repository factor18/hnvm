require_relative '../node'

module HNVM
  module Executors
    class Node
      def execute(args)
        node = HNVM::Node.new
        node.download unless node.exists?
        if args.empty?
          exec("#{node.path}/bin/node")
        else
          exec("#{node.path}/bin/node #{args.map {|a| a.dump}.join(' ')}")
        end
      end
    end
  end
end

HNVM::Executors::Node.new.execute(ARGV)
