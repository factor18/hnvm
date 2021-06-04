require_relative '../node'

module HNVM
  module Executors
    class Npm
      def execute(args)
        node = HNVM::Node.new
        node.download unless node.exists?
        if args.empty?
          exec("#{node.path}/bin/npm")
        else
          exec("#{node.path}/bin/npm #{args.map {|a| a.dump}.join(' ')}")
        end
      end
    end
  end
end

HNVM::Executors::Npm.new.execute(ARGV)
