require "rails_helper"

RSpec.describe "New users" do
  scenario "user signs up and creates a new account" do
    visit root_path

    expect(page).to have_text("You need to sign in or sign up before continuing.")

    click_on "Sign up"

    fill_in "Email", with: "mateo@sujatovich.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Sign up"

    expect(page).to have_text("Create your account to start using Testbox")

    fill_in "Name", with: "Conociendo Rusia"
    click_on "Create Account"

    expect(page).to have_text("Account created successfully.")
    expect(page).to have_text("My test inbox")
  end
end
