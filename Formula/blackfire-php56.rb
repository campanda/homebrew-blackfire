#encoding: utf-8

require File.expand_path("../../Abstract/abstract-blackfire-php-extension", __FILE__)

class BlackfirePhp56 < AbstractBlackfirePhpExtension
    init
    homepage "https://blackfire.io"
    version '1.18.2'

    url 'http://packages.blackfire.io/homebrew/blackfire-php_1.18.2-darwin_amd64-php56.tar.gz'
    sha256 'f505f83433423ce8e72eeb07ae4e823e4afa794e9369a97d89b7cd35b8aa410b'

    def install
        prefix.install "blackfire.so"
        write_config_file
    end

    def config_file
        super + <<-EOS.undent
        blackfire.agent_socket = unix:///usr/local/var/run/blackfire-agent.sock
        blackfire.agent_timeout = 0.25
        ;blackfire.log_level = 3
        ;blackfire.log_file = /tmp/blackfire.log
        ;blackfire.server_id =
        ;blackfire.server_token =
        EOS
    end
end
