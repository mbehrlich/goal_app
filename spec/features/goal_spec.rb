require 'spec_helper'
require 'rails_helper'

feature "the adding goal process" do

  scenario "has new goal page" do
    visit new_goal_url
    expect(page).to have_content("New Goal")
  end

  feature "creating a new goal" do

    scenario "shows goal on user page after creation of goal" do
      visit new_goal_url
      fill_in "body", with: "mygoalldjfakdfjadlk;jfal;nb"
      click_on "Add Goal"
      expect(page).to have_content("mygoalldjfakdfjadlk;jfal;nb")
    end

  end


end


feature "editing a goal" do

  scenario "has an edit goal page" do
    visit goals_url
    
  end

  feature "updating a goal" do

    scenario "redirect to user homepage"

    scenario "has button to mark goal completed"
  end

end


feature "deleting a goal" do

  scenario "has delete goal button"
end


feature "viewing a goal" do

  scenario "show goal page shows user's goals"
end
