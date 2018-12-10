#!/usr/bin/env ruby
#
# Example:
# ruby initit.rb [file].[sh]/[yaml]/[json]
# 
# Troubleshooting:
# ruby -ropen-uri -e 'eval open("https://git.io/vQhWq").read'
require 'rubygems'
require 'yaml'
require 'json'
require 'io/console'

# Shell linter
def shell_check(file)
  # ShellCheck: https://github.com/koalaman/shellcheck/wiki/Ignore
  vIgnore = 'SC2009'
  system("shellcheck -e #{vIgnore} " + file)
end

# yaml linter
def yaml_check(file)
  YAML.load_file(file)
  rescue Exception => err
    puts "YAML invalid: #{err}"
    false
end

# Json linter
def json_check(file)
  JSON.parse( IO.read(file) )
  rescue Exception => err
    puts "JSON invalid: #{err}"
    false
end

# go through list of files, and call adequate checks
IO.popen(["ls", "./"]).readlines.each { |file|
  file.sub!(/^\w (.*)\n/,'\1')
  file.chomp! unless file.nil?
  puts "Processing #{file}"
  if file.match(/(.sh$|.bash$)/)
    exit 1 unless bash_check file
    exit 1 unless shell_check file
  elsif file.match(/(.yaml$|.yml$|.eyaml$)/)
    exit 1 unless yaml_check file
  elsif file.match('\.json$')
    exit 1 unless json_check file
  end
}

