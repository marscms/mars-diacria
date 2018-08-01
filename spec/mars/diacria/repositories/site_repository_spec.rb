RSpec.describe Mars::Diacria::SiteRepository do
  let(:adapter) { double }
  let(:attributes) do
    { name: "foo", picture_url: "bar.png", handle: "foo", created_by_id: "ID" }
  end

  before do
    Mars::Diacria::SiteRepository.adapter = adapter
  end

  include_examples "repository can create"
  include_examples "repository can update"
  include_examples "repository can delete"

  describe ".find" do
    it "call create on adapter" do
      expect(adapter).to receive(:find).with(123).and_return(attributes)
      Mars::Diacria::SiteRepository.find(123)
    end

    it "build new entity with attributes from adapter" do
      expect(adapter).to receive(:find).with(123).and_return(attributes)
      expect(Mars::Diacria::Site).to receive(:new).with(attributes)
      Mars::Diacria::SiteRepository.find(123)
    end

    it "return new entity" do
      expect(adapter).to receive(:find).with(123).and_return(attributes)
      result = Mars::Diacria::SiteRepository.find(123)
      expect(result).to eq(Mars::Diacria::Site.new(attributes))
    end
  end
end
