require 'rails_helper'

RSpec.describe Camera, type: :model do
  subject do 
    Camera.new name: 'Canon 1', manufacturer: 'Factory', sku: '123', flash: true, type: 'Video' 
  end
  
  it 'returns a content with the right text' do
    expect(subject.get_content).to include('Canon 1')
    expect(subject.get_content).to include('Video')
  end
end

