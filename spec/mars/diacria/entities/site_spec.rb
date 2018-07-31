RSpec.describe Mars::Diacria::Site do
  it "disallow to create new instance without name attribute" do
    if ["0.1.0", "0.1.1", "0.2.0", "0.2.1"].include?(Dry::Struct::VERSION)
      error_class = Dry::Types::ConstraintError
      error_message = "nil violates constraints (type?(String, nil) failed)"
    else
      error_class = Dry::Struct::Error
      error_message = "[Mars::Diacria::Site.new] :name is missing in Hash input"
    end

    expect {
      Mars::Diacria::Site.new
    }.to raise_error(error_class, error_message)
  end

  it "disallow to create new instance without picture_url attribute" do
    error_class = Dry::Struct::Error
    error_message = "[Mars::Diacria::Site.new] :picture_url is missing in Hash input"

    expect {
      Mars::Diacria::Site.new(name: "foo")
    }.to raise_error(error_class, error_message)
  end

  it "disallow to create new instance without handle attribute" do
    error_class = Dry::Struct::Error
    error_message = "[Mars::Diacria::Site.new] :handle is missing in Hash input"

    expect {
      Mars::Diacria::Site.new(name: "foo", picture_url: "foo.png")
    }.to raise_error(error_class, error_message)
  end

  it "disallow to create new instance without created_by_id attribute" do
    error_class = Dry::Struct::Error
    error_message = "[Mars::Diacria::Site.new] :created_by_id is missing in Hash input"

    expect {
      Mars::Diacria::Site.new(
        name: "foo", picture_url: "foo.png", handle: "foo"
      )
    }.to raise_error(error_class, error_message)
  end

  context "with all necessary attributes" do
    it "allows to create instance" do
      expect {
        Mars::Diacria::Site.new(
          name: "foo", picture_url: "foo.png", handle: "foo", created_by_id: "1"
        )
      }.not_to raise_error
    end
  end
end
