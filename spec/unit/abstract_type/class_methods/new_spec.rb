# encoding: utf-8

require 'spec_helper'

describe AbstractType::ClassMethods, '#new' do
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
