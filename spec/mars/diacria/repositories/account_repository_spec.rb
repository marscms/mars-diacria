RSpec.describe Mars::Diacria::AccountRepository do
  let(:adapter) { double }

  before do
    Mars::Diacria::AccountRepository.adapter = adapter
  end
end
