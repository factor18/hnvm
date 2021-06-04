require_relative '../node'

module HNVM
  module Executors
    class Npx
      def execute(args)
        node = HNVM::Node.new
        node.download unless node.exists?
        if args.empty?
          exec("#{node.path}/bin/npx")
        else
          exec("#{node.path}/bin/npx #{args.map {|a| a.dump}.join(' ')}")
        end
      end
    end
  end
end

HNVM::Executors::Npx.new.execute(ARGV)
