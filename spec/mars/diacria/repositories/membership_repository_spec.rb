RSpec.describe Mars::Diacria::MembershipRepository do
  let(:adapter) { double }
  let(:attributes) do
    { role: "member", account_id: "123", site_id: "456" }
  end

  before do
    Mars::Diacria::MembershipRepository.adapter = adapter
  end

  include_examples "repository can create"
  include_examples "repository can update"
  include_examples "repository can delete"

  describe ".find" do
    it "call create on adapter" do
      expect(adapter).to receive(:find).with(123).and_return(attributes)
      Mars::Diacria::MembershipRepository.find(123)
    end

    it "build new entity with attributes from adapter" do
      expect(adapter).to receive(:find).with(123).and_return(attributes)
      expect(Mars::Diacria::Membership).to receive(:new).with(attributes)
      Mars::Diacria::MembershipRepository.find(123)
    end

    it "return new entity" do
      expect(adapter).to receive(:find).with(123).and_return(attributes)
      result = Mars::Diacria::MembershipRepository.find(123)
      expect(result).to eq(Mars::Diacria::Membership.new(attributes))
    end
  end
end
