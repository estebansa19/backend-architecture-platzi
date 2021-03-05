require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:product) { Product.new name: 'Pepe', manufacturer: 'Factory', sku: '123' }

  subject do
    Review.new(title: 'example', content: 'example content', author: 'Juan', product: product) 
  end

  it 'returns the right title' do
    expect(subject.title).to eq('example')
  end

  it 'returns the right content' do
    expect(subject.content).to eq('example content')
  end
    
  it 'returns the right author' do
    expect(subject.author).to eq('Juan')
  end

  it 'returns the right product' do
    expect(subject.product).to eq(product)
  end
end
