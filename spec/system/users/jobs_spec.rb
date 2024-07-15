require "rails_helper"

RSpec.describe "jobs", type: :system do
  context "ログインしていない場合" do
    describe "アクセス制限" do
      it "ログイン画面に遷移する" do
        visit jobs_path
        expect(page).to have_current_path new_user_session_path
        expect(page).to have_content "You need to sign in or sign up before continuing."
      end
    end
  end

  context "ログインしている場合" do
    let!(:user) { create(:user) }

    before do
      sign_in user
    end

    describe "新規作成" do
      it "jobを作成後、一覧画面に追加される" do
        visit jobs_path
        click_link "Post a new job"
        fill_in "job_title", with: "job01"
        fill_in_rich_text_area "job_description", with: "description"
        fill_in "job_location", with: "location"
        click_button "Submit"

        expect(page).to have_current_path jobs_path
        expect(page).to have_content "job01"
      end
    end
  end
end