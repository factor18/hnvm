require 'byebug'
require_relative 'config'
require_relative 'resolver'

module HNVM
  class Node
    def initialize
      resolver = HNVM::Resolver.new
      @node_version = ENV["HNVM_NODE"] || resolver.node_version || `wget -qO- https://nodejs.org/dist/latest/ | sed -nE 's|.*>node-v(.*)\.pkg</a>.*|\\1|p'`.strip
      @hnvm_node_dist = ENV["HNVM_NODE_DIST"] || "https://nodejs.org/dist"
      @node_path = "#{$hnvm_path}/node/#{@node_version}"
    end

    def path
      @node_path
    end

    def exists?
      File.directory? @node_path
    end

    def download
      $log.info "#{$assistant}: Downloading node at '#{@node_path}'"
      system("mkdir -p #{@node_path}")
      url = "#{@hnvm_node_dist}/v#{@node_version}/node-v#{@node_version}-#{$os_family}-x64.tar.gz"
      $log.info "#{$assistant}: Downloading from #{url}"
      if system("curl \"#{url}\" --silent | tar xz -C \"#{@node_path}\" --strip-components=1")
        $log.info "#{$assistant}: Downloaded"
      else
        $log.info "#{$assistant}: Download Failed"
      end
    end
  end
end
