require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET#new" do
    it "renders new link page" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST#create" do
    context "with valid params" do
      it "redirect to show page on success" do
        post :create, user: { username: "gooduser", password: "goodpassword"}
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    context "with invalid params" do
      it "render new page on failure" do
        post :create, user: { username: "gooduser", password: ""}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end
  end


end
