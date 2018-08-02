RSpec.describe Mars::Diacria::SiteRepository do
  let(:adapter) { double }

  before do
    Mars::Diacria::SiteRepository.adapter = adapter
  end
end
