RSpec.shared_examples "repository can delete" do
  it "can create" do
    modules = described_class.singleton_class.included_modules
    expect(modules).to include(Mars::Diacria::DeleteRepositoryMethod)
    expect(described_class.respond_to?(:delete)).to eq(true)
  end
end
