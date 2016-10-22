require_relative 'decorator'

describe Decorator do
  it 'decorator method' do
    expect(+AddPrefix).to eq(AddPrefix)
  end
end
