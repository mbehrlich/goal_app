require 'spec_helper'
require 'rails_helper'

feature "the adding goal process" do

  scenario "has new goal page" do
    login_new_user
    visit new_goal_url
    expect(page).to have_content("New Goal")
  end

  feature "creating a new goal" do

    scenario "shows goal on user page after creation of goal" do
      login_new_user
      create_goal
      expect(page).to have_content("test_goal")
    end

  end


end


feature "editing a goal" do

  scenario "has an edit goal page" do
    login_new_user
    create_goal
    visit edit_goal_url(Goal.last)
    expect(page).to have_content("Edit Goal")
  end

  feature "updating a goal" do

    scenario "redirect to goal page" do
      login_new_user
      create_goal
      visit edit_goal_url(Goal.last)
      fill_in "body", with: "updated_test_goal"
      click_on "Update Goal"
      expect(page).to have_content("updated_test_goal")
    end

    scenario "has radio input to mark goal completed" do
      login_new_user
      create_goal
      visit edit_goal_url(Goal.last)
      choose 'completed'
      click_on "Update Goal"
      expect(page).to have_content("completed")
    end
  end

end


feature "deleting a goal" do

  scenario "deletes a goal" do
    login_new_user
    create_goal
    click_on "Delete Goal"
    expect(page).to_not have_content("test_goal")
  end
end


feature "viewing a goal" do

  scenario "show goal page shows user's goal" do
    login_new_user
    create_goal
    expect(page).to have_content("test_goal")
  end
end
