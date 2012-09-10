# encoding: utf-8

require 'spec_helper'

describe AbstractClass::ClassMethods, '#abstract_method' do
  subject { object.some_method }

  let(:object) do 
    Class.new do 
      include Abstract

      abstract_singleton_method :some_method

      def self.name; 'TheClassName'; end
    end
  end

  it 'creates an abstract method' do
    expect { subject }.to raise_error(NotImplementedError, 'TheClassName.some_method is not implemented')
  end
end
