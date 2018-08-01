RSpec.shared_examples "repository can create" do
  it "can create" do
    modules = described_class.singleton_class.included_modules
    expect(modules).to include(Mars::Diacria::CreateRepositoryMethod)
    expect(described_class.respond_to?(:create)).to eq(true)
  end
end
