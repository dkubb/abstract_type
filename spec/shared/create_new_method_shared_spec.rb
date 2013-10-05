# encoding: utf-8

shared_examples 'AbstractType.create_new_method' do
  context 'called on a subclass' do
    let(:object) { Class.new(abstract_type) }

    it { should be_instance_of(object) }
  end

  context 'called on the class' do
    let(:object) { abstract_type }

    specify do
      expect { subject }.to raise_error(
        NotImplementedError,
        "#{object} is an abstract type"
      )
    end
  end
end
