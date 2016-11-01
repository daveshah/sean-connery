require "sean/connery/version"

require 'pry'
module Sean
  module Connery
    S_REGEX = /([^_]?)([s][sh]*|z)([\s$]?)/
    C_REGEX = /([^_]?)c([eiy])/
    ESS_REGEX = /_s([\s_]|$)/

    def ping
      result = super
      undef ping
      puts 'One. ping. only.'
      result
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def new(*args, &block)
        obj = super
        Sean::Connery.seanify_the obj
        obj
      end
    end

    def self.say(something)
      something
       .gsub(S_REGEX, '\1sh\3')
       .gsub(C_REGEX, '\1sh\2')
       .gsub('x', 'ksh')
       .gsub(ESS_REGEX, '_esh\1')
    end

    def self.seanify_the(obj)
      obj.methods.find_all { |m| m.to_s.include?('s') }.each do |method|
        Sean::Connery.aliash_the obj, method
      end
      obj.class.methods.find_all { |m| m.to_s.include?('s') }.each do |method|
        Sean::Connery.aliash_the obj.class, method
      end
    end

    def self.aliash_the(base, method)
      owner = base.method(method).owner
      owner.send :alias_method, self.say(method.to_s).to_sym, method
    end
  end
end
