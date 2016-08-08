require "spec_helper"
require "rails_helper"

feature "the signup process" do
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content("New User")
  end

  feature "signing up a user" do
    scenario "shows username on the homepage after signup" do
      visit new_user_url
      fill_in 'Username', with: "test_user"
      fill_in 'Password', with: "testpassword"
      click_on 'Sign up'
      expect(page).to have_content('test_user')
    end
  end
end


feature "loggin in" do
  scenario "shows username on the homepage after login" do
    user = FactoryGirl.create(:user)
    visit new_session_url
    login(user)
    expect(page).to have_content(user.username)

  end
end

feature "logging out" do
  scenario "begins with a logged out state" do
    visit goals_url
    expect(page).to have_content("Sign Up")
  end

  scenario "doesn't show username on the homepage after logout" do
    user = FactoryGirl.create(:user)
    visit new_session_url
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_on 'Log out'
    expect(page).to_not have_content(user.username)
  end

end
