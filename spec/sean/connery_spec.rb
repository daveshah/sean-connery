require 'spec_helper'
require 'pry'

class Stub
  include Sean::Connery

  def initialize(foos)
    @foos = foos
  end

  def foos
    @foos
  end

  def self.bars
  end
end


describe Sean::Connery do
  class << self
    alias_method :he, :it
    alias_method :he_eventually, :pending
  end

  subject { Stub.new("") }

  he 'repeats when you tell him to say with an accent' do
    expect(Sean::Connery.say('she sells sea shells by the sea shore'))
      .to eq "she shellsh shea shellsh by the shea shore"
  end

  he 'pronounces your instance methods with an accent' do
    expect(subject.methods).to include(:foosh)
  end

  he_eventually 'pronounces your class methods with an accent' do
    expect(subject.methods).to include(:barsh)
  end

  he 'will only ping once' do
    class Ping
      prepend Sean::Connery

      def ping
        'Verify our range to target'
      end
    end

    p = Ping.new

    expect(p.ping).to eq 'Verify our range to target'
    expect { p.ping }.to raise_error(NoMethodError)
  end
end
