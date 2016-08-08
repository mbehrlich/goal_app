require 'spec_helper'
require 'rails_helper'

feature "add comments to users" do

  scenario "Comment with no body" do
    login_new_user
    click_button "Add Comment"
    expect(page).to have_content "Error"
  end

  scenario "Valid comment" do
    login_new_user
    fill_in "comment", with: "This is a comment"
    click_button "Add Comment"
    expect(page).to have_content "This is a comment"
  end

end

feature "add comments to goals" do
  scenario "Comment with no body" do
    login_new_user
    create_goal
    click_button "Add Comment"
    expect(page).to have_content "Error"
  end

  scenario "Valid comment" do
    login_new_user
    create_goal
    fill_in "comment", with: "This is a comment"
    click_button "Add Comment"
    expect(page).to have_content "This is a comment"
  end
end

feature "delete comments from users" do
  scenario "You delete your own comment" do
    login_new_user
    fill_in "comment", with: "This is a comment"
    click_button "Add Comment"
    click_button "Delete Comment"
    expect(page).to_not have_content "This is a comment"
  end

  scenario "You attempt to delete other's comments" do
    user1 = login_new_user
    fill_in "comment", with: "This is a comment"
    click_button "Add Comment"
    click_on "Log out"
    user2 = login_new_user
    visit user_url(user1)
    click_button "Delete Comment"
    expect(page).to have_content "This is a comment"
  end
end

feature "delete comments from goals" do
  scenario "Delete your own comment from goal" do
    login_new_user
    create_goal
    fill_in "comment", with: "My comment"
    click_button "Add Comment"
    click_button "Delete Comment"
    expect(page).to_not have_content "My comment"
  end

  scenario "unable to delete other's comments from goals" do
    user1 = login_new_user
    create_goal
    fill_in "comment", with: "This is a comment"
    click_button "Add Comment"
    click_on "Log out"
    user2 = login_new_user
    visit goal_url(Goal.last)
    click_button "Delete Comment"
    expect(page).to have_content "This is a comment"
  end
end
