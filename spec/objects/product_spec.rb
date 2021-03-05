require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { Product.new name: 'Pepe', manufacturer: 'Factory', sku: '123' }
  
  it 'returns a content that is not nil or empty' do
    expect(subject.get_content).to_not be_empty
  end
end
