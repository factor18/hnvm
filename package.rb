require_relative 'lib/config'

module HNVM
  CURRENT_PATH = File.expand_path(File.dirname(__FILE__))

  class Package
    def install
      check_os
      $log.info "#{$assistant}: Installing HNVM"
      if CURRENT_PATH != $hnvm_path
        system("rm -Rf #{$hnvm_path}")
        print "."
        system("cp -R #{CURRENT_PATH} #{$hnvm_path}")
        print "."
      end
      system("sed -i '' \"/hnvm/d\" ~/.profile ~/.zshrc ~/.bashrc")
      print "."
      system("echo 'export PATH=\"#{$hnvm_path}/bin:$PATH\"' | tee -a ~/.profile ~/.zshrc ~/.bashrc >> /dev/null")
      puts "."
      $log.info "#{$assistant}: HNVM installed"
    end

    def uninstall
      $log.info "#{$assistant}: Uninstalling HNVM"
      system("sed -i '' \"/hnvm/d\" ~/.profile ~/.zshrc ~/.bashrc")
      puts "."
      system("rm -Rf #{$hnvm_path}")
      print "."
      exec("cd ~/")
      $log.info "#{$assistant}: Uninstalled HNVM"
    end

    private

    def check_os
      return unless $os_family == 'unsupported'
      $log.error "#{$assistant}: Unsupported OS (#{$os_family})"
      exit(false)
    end
  end
end
