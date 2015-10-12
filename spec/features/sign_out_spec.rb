require_relative "../spec_helper"
RSpec.describe "Sign out" do
  it "has sign out feature" do
    user = create_user("Frank Sun")
    sign_in(user)
    visit "/users/#{user.id}"
    click_button "Sign Out"
    expect(current_path).to eq("/sessions/new") 
  end
end