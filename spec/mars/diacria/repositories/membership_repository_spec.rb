RSpec.describe Mars::Diacria::MembershipRepository do
  let(:adapter) { double }

  before do
    Mars::Diacria::MembershipRepository.adapter = adapter
  end
end
