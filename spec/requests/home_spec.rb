require 'rails_helper'

RSpec.describe "Homes", type: :request do
  let(:user) { User.create }

  describe "GET /index with signed in user" do
    it "returns http success" do
      sign_in(user)
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index witouth signed in user" do
    it "redirects to the login page" do
      get "/"
      expect(response).to have_http_status(:redirect)
    end
  end
end
