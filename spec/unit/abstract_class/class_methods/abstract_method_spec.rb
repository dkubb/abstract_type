# encoding: utf-8

require 'spec_helper'

describe AbstractClass::ClassMethods, '#abstract_method' do
  subject { object.some_method }

  let(:abstract_class) do
    Class.new do
      include AbstractClass

      abstract_method :some_method
    end
  end

  let(:class_under_test)do
    Class.new(abstract_class) do
      def self.name; 'TheClassName'; end
    end
  end

  let(:object) { class_under_test.new }

  it 'creates an abstract method' do
    expect { subject }.to raise_error(NotImplementedError,'TheClassName#some_method is not implemented')
  end
end
