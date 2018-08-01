RSpec.shared_examples "repository can update" do
  it "can create" do
    modules = described_class.singleton_class.included_modules
    expect(modules).to include(Mars::Diacria::UpdateRepositoryMethod)
    expect(described_class.respond_to?(:update)).to eq(true)
  end
end
