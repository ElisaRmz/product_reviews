require 'rails_helper'

RSpec.describe "/reviews", type: :request do
  let(:valid_attributes) do
    { user_id: user.id, product_id: product.id, score: 5, comment: "comment"}
  end

  let(:invalid_attributes) do
    { user_id: user.id, product_id: product.id, score: 6, comment: "comment"}
  end

  let(:user) { User.create }
  let(:product) { user.products.create(name: "name", url: "https://test.com", description: "description") }

  before(:each) do
    sign_in(user)
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Review" do
        expect {
          post product_reviews_url(product), params: { review: valid_attributes }
        }.to change(Review, :count).by(1)
      end

      it "redirects to the created review" do
        post product_reviews_url(product), params: { review: valid_attributes }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Review" do
        expect {
          post product_reviews_url(product), params: { review: invalid_attributes }
        }.to change(Review, :count).by(0)
      end


      it "renders a redirect response with 302 status" do
        post product_reviews_url(product), params: { review: invalid_attributes }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested review" do
      review = Review.create! valid_attributes
      expect {
        delete product_review_url(product, review)
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the reviews list" do
      review = Review.create! valid_attributes
      delete product_review_url(product, review)
      expect(response).to redirect_to(product_url(product))
    end
  end
end
