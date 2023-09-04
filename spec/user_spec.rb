require_relative '../src/model/user.rb'

describe User do

  let(:user_with_empty_fields) {
    User.new("", "", "", "", [])
  }

  let(:user_lowercase) {
    User.new("loredana popescu", "agent imobiliar", "loredana@gmail.com", "strada republicii nr 34", [])
  }

  let(:user_empty_name) {
    User.new("", "bucatar", "empty@gmail.com", "calea dorobantilor", [])
  }

  describe "initialize" do
    context "given empty strings for user fields" do
      it "should create a user" do
        expect(user_with_empty_fields.name).to eq("")
        expect(user_with_empty_fields.job).to eq("")
        expect(user_with_empty_fields.email).to eq("")
        expect(user_with_empty_fields.address).to eq("")
        expect(user_with_empty_fields.bank_accounts).to eq([])
      end
    end

    context "given lowercase words for user fields" do
      it "should create a user" do
        expect(user_lowercase.name).to eq("loredana popescu")
        expect(user_lowercase.job).to eq("agent imobiliar")
        expect(user_lowercase.email).to eq("loredana@gmail.com")
        expect(user_lowercase.address).to eq("strada republicii nr 34")
        expect(user_lowercase.bank_accounts).to eq([])
      end
    end

    context "given empty name string" do
      it "should create a user" do
        expect(user_empty_name.name).to eq("")
        expect(user_empty_name.job).to eq("bucatar")
        expect(user_empty_name.email).to eq("empty@gmail.com")
        expect(user_empty_name.address).to eq("calea dorobantilor")
        expect(user_empty_name.bank_accounts).to eq([])
      end
    end
  end

end
