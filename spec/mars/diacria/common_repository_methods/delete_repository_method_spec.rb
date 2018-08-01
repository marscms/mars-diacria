require "ostruct"

module SampleRepositoryWithDelete
  extend Mars::Diacria::BaseRepository
  extend Mars::Diacria::DeleteRepositoryMethod
end

RSpec.describe Mars::Diacria::DeleteRepositoryMethod do
  let(:adapter) { double }
  let(:entity) { OpenStruct.new(foo: :bar) }

  before do
    SampleRepositoryWithDelete.adapter = adapter
  end

  it "call delete on adapter" do
    expect(adapter).to receive(:delete)
    SampleRepositoryWithDelete.delete(entity)
  end

  it "returns nil" do
    expect(adapter).to receive(:delete)
    result = SampleRepositoryWithDelete.delete(entity)
    expect(result).to eq(nil)
  end
end
