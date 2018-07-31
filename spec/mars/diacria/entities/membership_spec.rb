RSpec.describe Mars::Diacria::Membership do
  it "disallow to create new instance without role attribute" do
    if ["0.1.0", "0.1.1", "0.2.0", "0.2.1"].include?(Dry::Struct::VERSION)
      error_class = Dry::Types::ConstraintError
      error_message = "nil violates constraints (type?(String, nil) failed)"
    else
      error_class = Dry::Struct::Error
      error_message = "[Mars::Diacria::Membership.new] :role is missing in Hash input"
    end

    expect {
      Mars::Diacria::Membership.new
    }.to raise_error(error_class, error_message)
  end

  it "disallow to create new instance without account_id attribute" do
    error_class = Dry::Struct::Error
    error_message = "[Mars::Diacria::Membership.new] :account_id is missing in Hash input"

    expect {
      Mars::Diacria::Membership.new(role: "foo")
    }.to raise_error(error_class, error_message)
  end

  it "disallow to create new instance without site_id attribute" do
    error_class = Dry::Struct::Error
    error_message = "[Mars::Diacria::Membership.new] :site_id is missing in Hash input"

    expect {
      Mars::Diacria::Membership.new(role: "foo", account_id: "ACCOUNT ID")
    }.to raise_error(error_class, error_message)
  end

  context "with all necessary attributes" do
    it "allows to create instance" do
      expect {
        Mars::Diacria::Membership.new(
          role: "foo", account_id: "ACCOUNT ID", site_id: "SITE ID"
        )
      }.not_to raise_error
    end
  end
end
