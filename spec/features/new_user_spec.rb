require_relative "../spec_helper"
RSpec.describe "new user" do
  it "displays correct fields to create a new user" do
    visit "/users/new"
    expect(page.status_code).to eq(200)
    expect(page).to have_field('Email')
    expect(page).to have_field('First_name')
    expect(page).to have_field('Last_name')
    expect(page).to have_field('Password')
    expect(page).to have_field('Password_confirmation')
  end
end