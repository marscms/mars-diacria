require "ostruct"

module SampleRepositoryWithCreate
  extend Mars::Diacria::BaseRepository
  extend Mars::Diacria::CreateRepositoryMethod
end

RSpec.describe Mars::Diacria::CreateRepositoryMethod do
  let(:adapter) { double }
  let(:entity) { OpenStruct.new(foo: :bar) }

  before do
    SampleRepositoryWithCreate.adapter = adapter
  end

  it "call create on adapter" do
    expect(adapter).to receive(:create).and_return({})
    SampleRepositoryWithCreate.create(entity)
  end

  it "build new entity with attributes from adapter" do
    obj = entity
    expect(adapter).to receive(:create).and_return({ bar: :foo })
    expect(OpenStruct).to receive(:new).with({ bar: :foo })
    SampleRepositoryWithCreate.create(obj)
  end

  it "return new entity" do
    expect(adapter).to receive(:create).and_return({ bar: :foo })
    result = SampleRepositoryWithCreate.create(entity)
    expect(result).to eq(OpenStruct.new(bar: :foo))
  end
end
