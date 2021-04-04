require_relative '../node'

module HNVM
  module Executors
    class Npx
      def execute(args)
        node = HNVM::Node.new
        node.download unless node.exists?
        exec("#{node.path}/bin/npx #{args}")
      end
    end
  end
end

HNVM::Executors::Npx.new.execute(ARGV.join(" "))
