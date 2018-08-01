RSpec.describe Mars::Diacria::Factory do
  it "allows to create entity with passed attributes" do
    attributes = { name: "tester" }
    result = Mars::Diacria::Factory.build(Mars::Diacria::Account, attributes)
    expect(result).to be_a(Mars::Diacria::Account)
    expect(result.name).to eq("tester")
  end

  it "allows to create entity with unexisted attribute" do
    attributes = { name: "tester", foo: "bar" }
    expect {
      Mars::Diacria::Factory.build(Mars::Diacria::Account, attributes)
    }.not_to raise_error
  end

  it "allows to create entity with multiple attributes" do
    attributes = [{ name: "tester" }, { name: "tester2" }]
    result = Mars::Diacria::Factory.build(Mars::Diacria::Account, attributes)
    expect(result).to be_a(Mars::Diacria::Account)
    expect(result.name).to eq("tester2")
  end
end
