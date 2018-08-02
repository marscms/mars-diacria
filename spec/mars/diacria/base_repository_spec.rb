require "ostruct"

module SampleRepository
  extend Mars::Diacria::BaseRepository

  entity OpenStruct
end

RSpec.describe Mars::Diacria::BaseRepository do
  it "allows to set adapter" do
    SampleRepository.adapter = :foo
    expect(SampleRepository.adapter).to eq(:foo)
  end

  it "set default entity" do
    expect(SampleRepository.instance_variable_get(:@entity_class)).to eq(OpenStruct)
  end

  describe ".with_entity" do
    it "build single entity" do
      result = SampleRepository.with_entity do
        { foo: :bar }
      end

      expect(result.foo).to eq(:bar)
    end

    it "build collection of entities" do
      result = SampleRepository.with_entity do
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

  describe ".all" do
    before do
      SampleRepository.adapter = double
    end

    it "call .all on adapter" do
      expect(SampleRepository.adapter).to receive(:all).and_return([])
      SampleRepository.all
    end

    it "build new entity with attributes from adapter" do
      expect(SampleRepository.adapter).to receive(:all).and_return([{ bar: :foo2 }])
      expect(OpenStruct).to receive(:new).with({ bar: :foo2 })
      SampleRepository.all
    end

    it "return new entity" do
      expect(SampleRepository.adapter).to receive(:all).and_return([{ bar: :foo }])
      result = SampleRepository.all
      expect(result).to eq([OpenStruct.new(bar: :foo)])
    end
  end

  describe ".find" do
    before do
      SampleRepository.adapter = double
    end

    it "call .find on adapter" do
      expect(SampleRepository.adapter).to receive(:find).and_return({})
      SampleRepository.find(123)
    end

    it "build new entity with attributes from adapter" do
      expect(SampleRepository.adapter).to receive(:find).and_return({ bar: :foo2 })
      expect(OpenStruct).to receive(:new).with({ bar: :foo2 })
      SampleRepository.find(123)
    end

    it "return new entity" do
      expect(SampleRepository.adapter).to receive(:find).and_return({ bar: :foo })
      result = SampleRepository.find(123)
      expect(result).to eq(OpenStruct.new(bar: :foo))
    end
  end

  describe ".create" do
    let(:entity) { OpenStruct.new }

    before do
      SampleRepository.adapter = double
    end

    it "call .create on adapter" do
      expect(SampleRepository.adapter).to receive(:create).and_return({})
      SampleRepository.create(OpenStruct.new)
    end

    it "build new entity with attributes from adapter" do
      obj = entity
      expect(SampleRepository.adapter).to receive(:create).and_return({ bar: :foo2 })
      expect(OpenStruct).to receive(:new).with({ bar: :foo2 })
      SampleRepository.create(obj)
    end

    it "return new entity" do
      expect(SampleRepository.adapter).to receive(:create).and_return({ bar: :foo })
      result = SampleRepository.create(entity)
      expect(result).to eq(OpenStruct.new(bar: :foo))
    end
  end

  describe ".update" do
    let(:entity) { OpenStruct.new }

    before do
      SampleRepository.adapter = double
    end

    it "call .update on adapter" do
      expect(SampleRepository.adapter).to receive(:update).and_return({})
      SampleRepository.update(OpenStruct.new)
    end

    it "build new entity with attributes from adapter" do
      obj = entity
      expect(SampleRepository.adapter).to receive(:update).and_return({ bar: :foo2 })
      expect(OpenStruct).to receive(:new).with({ bar: :foo2 })
      SampleRepository.update(obj)
    end

    it "return new entity" do
      expect(SampleRepository.adapter).to receive(:update).and_return({ bar: :foo })
      result = SampleRepository.update(entity)
      expect(result).to eq(OpenStruct.new(bar: :foo))
    end
  end

  describe ".delete" do
    let(:entity) { OpenStruct.new }

    before do
      SampleRepository.adapter = double
    end

    it "call .delete on adapter" do
      expect(SampleRepository.adapter).to receive(:delete)
      SampleRepository.delete(OpenStruct.new)
    end

    it "return new entity" do
      expect(SampleRepository.adapter).to receive(:delete)
      result = SampleRepository.delete(entity)
      expect(result).to be_nil
    end
  end
end
