# encoding: utf-8

require 'spec_helper'

describe AbstractType, '.create_new_method' do
  context 'with arguments' do
    subject { object.new(:foo) }

    let(:abstract_type) do
      Class.new do
        include AbstractType

        def initialize(foo)
          @foo = foo
        end
      end
    end

    context 'called on a subclass' do
      let(:object) { Class.new(abstract_type) }

      it { should be_instance_of(object) }
    end

    context 'called on the class' do
      let(:object) { abstract_type }

      specify { expect { subject }.to raise_error(NotImplementedError, "#{object} is an abstract type") }
    end
  end

  context 'without arguments' do
    subject { object.new }

    let(:abstract_type) { Class.new { include AbstractType } }

    context 'called on a subclass' do
      let(:object) { Class.new(abstract_type) }

      it { should be_instance_of(object) }
    end

    context 'called on the class' do
      let(:object) { abstract_type }

      specify { expect { subject }.to raise_error(NotImplementedError, "#{object} is an abstract type") }
    end
  end

  context 'on an class that doesn\'t have Object as its superclass' do
    subject { object.new }

    let(:abstract_type) { Class.new(RuntimeError) { include AbstractType } }

    context 'called on a subclass' do
      let(:object) { Class.new(abstract_type) }

      it { should be_instance_of(object) }
    end

    context 'called on the class' do
      let(:object) { abstract_type }

      specify { expect { subject }.to raise_error(NotImplementedError, "#{object} is an abstract type") }
    end
  end
end
