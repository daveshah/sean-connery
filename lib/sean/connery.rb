require "sean/connery/version"

module Sean
  module Connery
    S_REGEX = /([^_]?)([s][sh]*|z)([\s$]?)/
    C_REGEX = /([^_]?)c([eiy])/
    ESS_REGEX = /_s([\s_]|$)/

    def self.included(base)
      base.extend(ClassMethods)
      # TODO - smarten up the replacement
      base.methods.find_all { |m| m.to_s.include?('s') }.each do |method|
        owner = base.method(method).owner
        owner.send :alias_method, replace_s_sounds(method.to_s).to_sym, method
      end
    end

    module ClassMethods
      # TODO - .new?
    end

    private

    def replace_s_sounds(str)
      str.gsub(S_REGEX, '\1sh\3').gsub(C_REGEX, '\1sh\2').gsub('x', 'ksh').gsub(ESS_REGEX, '_esh\1')
    end
  end
end
