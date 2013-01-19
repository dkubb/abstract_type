# encoding: utf-8

require 'spec_helper'

describe AbstractType::ClassMethods, '#abstract_singleton_method' do
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
    expect { subject }.to change { subclass.respond_to?(:some_method) }.
      from(false).
      to(true)
  end

  specification = proc do
    subject
    begin
      subclass.some_method
    rescue NotImplementedError => error
      error.message.should == 'Subclass.some_method is not implemented'
      file, line = error.backtrace.first.split(':', 2)
      File.expand_path(file).should eql(File.expand_path('../../../../../lib/abstract_type.rb', __FILE__))
      line.to_i.should be(95)
    else
      raise 'expected error not raised'
    end
  end

  it 'sets the file and line number properly' do
    if RUBY_PLATFORM.include?('java')
      pending('Kernel#caller returns the incorrect line number in JRuby', &specification)
    else
      instance_eval(&specification)
    end
  end
end
