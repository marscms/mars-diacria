require "ostruct"

module SampleRepository
  extend Mars::Diacria::BaseRepository
end

RSpec.describe Mars::Diacria::BaseRepository do
  it "allows to set adapter" do
    SampleRepository.adapter = :foo
    expect(SampleRepository.adapter).to eq(:foo)
  end

  it "build attributes with entity" do
    result = SampleRepository.with_entity(OpenStruct) do
      { foo: :bar }
    end

    expect(result.foo).to eq(:bar)
  end

  it "build collection of entities" do
    result = SampleRepository.with_entity(OpenStruct) do
      [
        { foo: :bar },
        { foo: :bar2 }
      ]
    end

    expect(result).to be_an(Array)
    expect(result.size).to eq(2)
    expect(result[0].foo).to eq(:bar)
    expect(result[1].foo).to eq(:bar2)
  end
end
