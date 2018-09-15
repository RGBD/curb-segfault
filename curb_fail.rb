#!/usr/bin/env ruby

require 'curl'
require 'timeout'
require 'openssl'

TARGET_URL = "https://ietf.org"
PROXY_URL = "127.0.0.1:8888"
RUBY_TIMEOUT = ARGV[0] && ARGV[0].to_f || 0.1

puts "RUBY_VERSION: #{RUBY_VERSION}"
puts "Curl::CURB_VERSION: #{Curl::CURB_VERSION}"
puts "OpenSSL::OPENSSL_VERSION: #{OpenSSL::OPENSSL_VERSION}"
puts "TARGET_URL: #{TARGET_URL}"
puts "PROXY_URL: #{PROXY_URL}"
puts "RUBY_TIMEOUT: #{RUBY_TIMEOUT}"

def create_easy
  easy = Curl::Easy.new(TARGET_URL)
  easy.timeout = 2
  easy.proxy_url = PROXY_URL
  easy.proxy_type = 0
  easy.on_debug { |a, b| puts a, b }
  easy
end

easy = create_easy

begin
  Timeout.timeout(RUBY_TIMEOUT) do
    easy.perform
  end
rescue Timeout::Error => e
  ap e
ensure
  easy.close
end

GC.start

puts 'exiting'
