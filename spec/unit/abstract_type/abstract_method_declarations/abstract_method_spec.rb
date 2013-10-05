# encoding: utf-8

require 'spec_helper'

describe AbstractType::AbstractMethodDeclarations, '#abstract_method' do
  subject { object.abstract_method(:some_method) }

  let(:object)   { Class.new { include AbstractType } }
  let(:subclass) { Class.new(object)                  }

  before do
    Subclass = subclass
  end

  after do
    Object.class_eval { remove_const(:Subclass) }
  end

  it { should equal(object) }

  it 'creates an abstract method' do
    expect { subject }.to change { subclass.method_defined?(:some_method) }
      .from(false)
      .to(true)
  end

  it 'creates an abstract method with the expected arity' do
    subject
    expect(object.instance_method(:some_method).arity).to be(-1)
  end

  it 'creates a method that raises an exception' do
    subject
    expect { subclass.new.some_method }.to raise_error(
      NotImplementedError,
      'Subclass#some_method is not implemented'
    )
  end
end
