require "spec_helper"

describe "Logging in" do
  it "logs the user in and goes to the todo lists" do
    User.create(first_name: "Ross", last_name: "Litz", email: "ross@example.com", password: "password1234", password_confirmation: "password1234")
    visit new_user_session_path
    fill_in "Email Address", with: "ross@example.com"
    fill_in "Password", with: "password1234"
    click_button "Log In"

    expect(page).to have_content("Todo Lists")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "displays the email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email Address", with: "ross@example.com"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email Address", with: "ross@example.com")
  end

end
