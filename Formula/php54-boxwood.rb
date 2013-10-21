require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Boxwood < AbstractPhp54Extension
  init
  homepage 'https://github.com/ning/boxwood'
  url 'https://github.com/ning/boxwood/archive/master.zip'
  sha1 '41631cdf67863868eba48de076ffe686c997af37'
  head 'https://github.com/ning/boxwood.git'
  version '1.0.0'

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/boxwood.so"
    write_config_file unless build.include? "without-config-file"
  end
end
