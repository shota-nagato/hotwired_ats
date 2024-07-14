require "rails_helper"

RSpec.describe "Sessions", type: :system do
  describe "アクセス制限" do
    context "ログインしていない場合" do
      it "root_pathがsign_in画面になる" do
        visit root_path
        expect(page).not_to have_content "Dashboard"
      end
    end
  end

  describe "ログイン/ログアウト機能" do
    before do
      create(:user, email: "user@example.com", password: "password")
    end

    context "正しいメールアドレスとパスワードを入力した場合" do
      it "ログインに成功しダッシュボードページに遷移し、ログアウトボタンを押してログアウトできる" do
        visit root_path
        fill_in "user_email", with: "user@example.com"
        fill_in "user_password", with: "password"
        click_button "Sign in"
        expect(page).to have_content "Signed in successfully."
        expect(page).to have_content "Dashboard"

        click_button "Log out"
        expect(page).to have_content "Signed out successfully."
        expect(page).not_to have_content "Dashboard"
      end
    end
  end
end
