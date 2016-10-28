require 'spec_helper'

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
end
