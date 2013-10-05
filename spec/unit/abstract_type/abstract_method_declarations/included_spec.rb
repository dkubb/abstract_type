# encoding: utf-8

require 'spec_helper'

describe AbstractType, '.included' do
  subject { object }

  let(:object) { described_class }
  let(:klass)  { Class.new       }

  it 'extends the klass' do
    expect(klass.singleton_class)
      .to_not include(described_class::AbstractMethodDeclarations)
    klass.send(:include, subject)
    expect(klass.singleton_class)
      .to include(described_class::AbstractMethodDeclarations)
  end

  it 'overrides the new singleton method' do
    expect(klass.method(:new).owner).to eq(Class)
    klass.send(:include, subject)
    expect(klass.method(:new).owner).to eq(klass.singleton_class)
  end

  it 'delegates to the ancestor' do
    included_ancestor = false
    subject.extend Module.new {
      define_method(:included) { |_| included_ancestor = true }
    }
    expect { klass.send(:include, subject) }
      .to change { included_ancestor }.from(false).to(true)
  end
end
