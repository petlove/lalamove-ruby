# frozen_string_literal: true

shared_examples 'entity_attributes' do |attrs|
  it 'expect to cover all attributes' do
    expect(subject.attributes.keys).to match_array(attrs)
  end
end
