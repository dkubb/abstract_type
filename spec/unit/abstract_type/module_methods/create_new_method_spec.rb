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

    it_behaves_like 'AbstractType.create_new_method'
  end

  context 'with a block' do
    subject { object.new(:foo) { nil } }

    let(:abstract_type) do
      Class.new do
        include AbstractType

        def initialize(foo)
          @foo = foo
          yield
        end
      end
    end

    it_behaves_like 'AbstractType.create_new_method'
  end

  context 'without arguments' do
    subject { object.new }

    let(:abstract_type) { Class.new { include AbstractType } }

    it_behaves_like 'AbstractType.create_new_method'
  end

  context 'on an class that doesn\'t have Object as its superclass' do
    subject { object.new }

    let(:abstract_type) { Class.new(RuntimeError) { include AbstractType } }

    it_behaves_like 'AbstractType.create_new_method'
  end
end
