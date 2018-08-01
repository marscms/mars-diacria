RSpec.describe Mars::Diacria::AccountRepository do
  let(:adapter) { double }

  before do
    Mars::Diacria::AccountRepository.adapter = adapter
  end

  include_examples "repository can create"
  include_examples "repository can update"
  include_examples "repository can delete"

  describe ".find" do
    it "call create on adapter" do
      expect(adapter).to receive(:find).with(123).and_return(name: "bar")
      Mars::Diacria::AccountRepository.find(123)
    end

    it "build new entity with attributes from adapter" do
      expect(adapter).to receive(:find).with(123).and_return(name: "bar")
      expect(Mars::Diacria::Account).to receive(:new).with(name: "bar")
      Mars::Diacria::AccountRepository.find(123)
    end

    it "return new entity" do
      expect(adapter).to receive(:find).with(123).and_return(name: "bar")
      result = Mars::Diacria::AccountRepository.find(123)
      expect(result).to eq(Mars::Diacria::Account.new(name: "bar"))
    end
  end
end
