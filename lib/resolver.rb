require 'parseconfig'

module HNVM
  class Resolver
    def initialize
      @hvmrc = nil
      home = File.expand_path('~/.hnvmrc')
      current = File.expand_path Dir.pwd + '/.hnvmrc'

      if(File.exists? current)
        @nvmrc = current
      elsif system('git rev-parse --show-toplevel &> /dev/null') && File.exists?(`git rev-parse --show-toplevel`.strip + '/.hnvmrc')
        @nvmrc = `git rev-parse --show-toplevel`.strip + '/.hnvmrc'
      elsif File.exists? home
        @nvmrc = home
      end

      @config = @nvmrc ? ParseConfig.new(@nvmrc) : nil
    end

    def node_version
      config('HNVM_NODE')
    end

    private

    def config(key)
      return nil unless @config
      @config[key]
    end
  end
end
