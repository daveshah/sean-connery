require "sean/connery/version"
require 'pry'

module Sean
  module Connery
    S_REGEX = /([^_]?)([s][sh]*|z)([\s$]?)/
    C_REGEX = /([^_]?)c([eiy])/
    ESS_REGEX = /_s([\s_]|$)/

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def new(*args, &block)
        obj = super
        obj.methods.find_all { |m| m.to_s.include?('s') }.each do |method|
          owner = obj.method(method).owner
          owner.send :alias_method,
            Sean::Connery.replace_s_sounds(method.to_s).to_sym, method
        end
       obj
      end
    end

    def ping
      result = super
      undef ping
      puts 'One. ping. only.'
      result
    end

    def self.aliash_the(base, method)
      owner = base.method(method).owner
      owner.send :alias_method, self.replace_s_sounds(method.to_s).to_sym, method
    end

    def self.replace_s_sounds(str)
      str.gsub(S_REGEX, '\1sh\3').gsub(C_REGEX, '\1sh\2').gsub('x', 'ksh').gsub(ESS_REGEX, '_esh\1')
    end
  end
end
