require_relative '../src/model/user.rb'
require_relative '../src/service/user_service.rb'

describe UserService do

  let(:user_to_find_email) {
    User.new("Francesca Ditulescu", "Intern", "franci@gmail.com", "Adresa", [])
  }

  let(:user1) {
    User.new("Alexandra Popescu", "doctor", "alexa2@gmail.com", "Adresa1", [])
  }

  let(:user2) {
    User.new("Gigi Bodea", "Militar", "gigi@gmail.com", "Adresa2", [])
  }

  describe "find_by_email" do
    context "given account with email that exists" do
      it "should return the user" do
        users = [user1, user_to_find_email, user2]
        email_to_find = "franci@gmail.com"
        found_user = UserService.find_by_email(users, email_to_find)

        expect(found_user).to eq(user_to_find_email)
      end
    end
  end

  describe "find_by_email" do
    context "given account with email that does not exist" do
      it "should return null" do
        users = [user1, user_to_find_email, user2]
        email_to_find = "franci234@gmail.com"
        found_user = UserService.find_by_email(users, email_to_find)

        expect(found_user).to eq(nil)
      end
    end
  end
  
end