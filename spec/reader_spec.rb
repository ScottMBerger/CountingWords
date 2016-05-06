require 'rspec'
require_relative '../reader'

describe 'Reader Class' do
  let(:read) { Reader.new('speech.txt') }

  describe '#clean' do
    it 'should strip, downcase, and split to array' do
      expect(read.clean('Hello HOW are, you?')).to eq(%w(hello how are you))
    end
  end

  describe '#sort_hash' do
    it 'should sort from highest value to lowest' do
      expect(read.sort_hash("foo": 2, "bar": 5, "foobar": 1)).to eq("bar": 5, "foo": 2, "foobar": 1)
    end
  end

  describe '#start' do
    it 'should clean, sort, and display the results' do
      expect { read.start }.to output.to_stdout
    end
  end
end
