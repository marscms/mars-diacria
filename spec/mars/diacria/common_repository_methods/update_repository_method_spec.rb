require "ostruct"

module SampleRepositoryWithUpdate
  extend Mars::Diacria::BaseRepository
  extend Mars::Diacria::UpdateRepositoryMethod
end

RSpec.describe Mars::Diacria::UpdateRepositoryMethod do
  let(:adapter) { double }
  let(:entity) { OpenStruct.new(foo: :bar) }

  before do
    SampleRepositoryWithUpdate.adapter = adapter
  end

  it "call update on adapter" do
    expect(adapter).to receive(:update).and_return({})
    SampleRepositoryWithUpdate.update(entity)
  end

  it "build new entity with attributes from adapter" do
    obj = entity
    expect(adapter).to receive(:update).and_return({ bar: :foo })
    expect(OpenStruct).to receive(:new).with({ bar: :foo })
    SampleRepositoryWithUpdate.update(obj)
  end

  it "return new entity" do
    expect(adapter).to receive(:update).and_return({ bar: :foo })
    result = SampleRepositoryWithUpdate.update(entity)
    expect(result).to eq(OpenStruct.new(bar: :foo))
  end
end
