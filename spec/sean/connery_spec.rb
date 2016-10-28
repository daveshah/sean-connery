require 'spec_helper'
require 'pry'

class Stub
  include Sean::Connery

  def initialize(bar)
    @bar = bar
  end

  def foos
  end
end


describe Sean::Connery do
  subject { Stub.new }

  it 'has seanified class methods' do
    expect(subject.methods).to be []
  end

  it 'can only ping once' do
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
