require 'spec_helper'

describe User do
  let!(:valid_attributes){
    {
      first_name: "Ross",
      last_name: "litz",
      email: "ross@example.com"
    }
  }
  context "validations" do
    let!(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "JONNYBOY@EXAMPLE.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "JONNYBOY@EXAMPLE.COM"))
      expect{ user.downcase_email }.to change{ user.email }.
        from( "JONNYBOY@EXAMPLE.COM" ).
        to( "jonnyboy@example.com" )
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "JONNYBOY@EXAMPLE.COM"
      expect(user.save).to be_true
      expect(user.email).to eq("jonnyboy@example.com")
    end
  end

end
