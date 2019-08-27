require 'rails_helper'

describe UsersController, type: :controller do

  describe 'GET #edit' do
    it "assigns the requested contact to @user" do
      user = create(:user)
      get :edit, params: { id: user }
      expect(assigns(:user)).to eq user
    end

    it "renders the :edit template" do
      user = create(:user)
      get :user, params: { id: user }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of users ordered by created_at DESC" do
      users = create_list(:user, 3)
      get :index
      expect(assigns(:users)).to match(users.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end