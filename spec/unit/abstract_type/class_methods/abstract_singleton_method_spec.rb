# encoding: utf-8

require 'spec_helper'

describe AbstractType::ClassMethods, '#abstract_method' do
  subject { object.some_method }

  let(:object) do
    Class.new do
      include AbstractType

      abstract_singleton_method :some_method
    end
  end

  before do
    TheClassName = object
  end

  after do
    Object.class_eval { remove_const(:TheClassName) }
  end

  it 'creates an abstract method' do
    expect { subject }.to raise_error(NotImplementedError, 'TheClassName.some_method is not implemented')
  end
end
