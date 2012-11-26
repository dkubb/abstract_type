# encoding: utf-8

require 'spec_helper'

describe AbstractType::ClassMethods, '#abstract_method' do
  subject { object.some_method }

  let(:abstract_type) do
    Class.new do
      include AbstractType

      abstract_method :some_method
    end
  end

  let(:class_under_test) do
    Class.new(abstract_type)
  end

  before do
    TheClassName = class_under_test
  end

  after do
    Object.class_eval { remove_const(:TheClassName) }
  end

  let(:object) { class_under_test.new }

  it 'creates an abstract method' do
    expect { subject }.to raise_error(NotImplementedError,'TheClassName#some_method is not implemented')
  end
end
