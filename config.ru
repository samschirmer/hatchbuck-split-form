require 'rubygems'
require 'httparty'
require 'sinatra'

require File.expand_path '../main.rb', __FILE__
run Sinatra::Application
