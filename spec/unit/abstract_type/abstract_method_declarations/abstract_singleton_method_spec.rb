# encoding: utf-8

require 'spec_helper'

describe AbstractType::AbstractMethodDeclarations,
         '#abstract_singleton_method' do
  subject { object.abstract_singleton_method(:some_method) }

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
    expect { subject }.to change { subclass.respond_to?(:some_method) }
      .from(false)
      .to(true)
  end

  it 'creates an abstract method with the expected arity' do
    subject
    expect(object.method(:some_method).arity).to be(-1)
  end

  it 'creates a method that raises an exception' do
    subject
    expect { subclass.some_method }.to raise_error(
      NotImplementedError,
      'Subclass.some_method is not implemented'
    )
  end
end
