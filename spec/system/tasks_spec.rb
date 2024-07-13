require "rails_helper"

RSpec.describe "Dashboard", type: :system do
  it "Dashboardという文字列が表示される" do
    visit root_path

    expect(page).to have_content "Dashboard"
  end
end
