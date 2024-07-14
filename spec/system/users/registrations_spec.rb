require "rails_helper"

RSpec.describe "Registrations", type: :system do
  describe "新規登録" do
    context "正しく情報を入力した場合" do
      it "新規ユーザー登録ができ、ユーザーに紐づくアカウントが作成される" do
        visit new_user_registration_path
        fill_in "user_account_attributes_name", with: "企業01"
        fill_in "user_email", with: "user@example.com"
        fill_in "user_password", with: "password"
        fill_in "user_password_confirmation", with: "password"

        expect do
          click_button "Sign up"
          expect(page).to have_current_path root_path
        end.to change(User, :count).by(1).and change(Account, :count).by(1)

        user = User.last
        account = Account.last
        expect(user.account).to eq(account)
      end
    end
  end
end
