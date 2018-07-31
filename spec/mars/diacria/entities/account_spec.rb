RSpec.describe Mars::Diacria::Account do
  it "disallow to create new instance without name attribute" do
    if ["0.1.0", "0.1.1", "0.2.0", "0.2.1"].include?(Dry::Struct::VERSION)
      error_class = Dry::Types::ConstraintError
      error_message = "nil violates constraints (type?(String, nil) failed)"
    else
      error_class = Dry::Struct::Error
      error_message = "[Mars::Diacria::Account.new] :name is missing in Hash input"
    end

    expect {
      Mars::Diacria::Account.new
    }.to raise_error(error_class, error_message)
  end

  context "with all necessary attributes" do
    it "allows to create instance" do
      expect {
        Mars::Diacria::Account.new(name: "tester")
      }.not_to raise_error
    end

    it "set false as default value in super_admin attribute" do
      account = Mars::Diacria::Account.new(name: "tester")
      expect(account.super_admin).to eq(false)
    end

    it "allow to set account with super_admin attribute" do
      account = Mars::Diacria::Account.new(name: "tester", super_admin: true)
      expect(account.super_admin).to eq(true)
    end
  end
end
