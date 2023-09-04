require_relative('../src/module/validator.rb')
require_relative('../src/model/user.rb')

describe Validator do

  let(:user1) {
    User.new("Alexandra Popescu", "doctor", "alexa2@gmail.com", "Adresa1", [])
  }

  let(:user2) {
    User.new("Gigi Bodea", "Militar", "gigi@gmail.com", "Adresa2", [])
  }

  let(:user3) {
    User.new("Francesca Ditulescu", "Intern", "franci@gmail.com", "Adresa", [])
  }

  describe "is_unique?" do
    context "given email that is not unique" do
      it "should return false" do
        users = [user1, user2, user3]
        email_not_unique = "franci@gmail.com"

        expect(Validator.is_unique?(users, email_not_unique)).to be false
      end
    end

    context "given email that is unique" do
      it "should return true" do
        users = [user1, user2, user3]
        email_not_unique = "franci1234@gmail.com"

        expect(Validator.is_unique?(users, email_not_unique)).to be true
      end
    end
  end

end
