require "rails_helper"

RSpec.describe ReviewsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(post: "/products/1/reviews").to route_to("reviews#create", product_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/products/1/reviews/2").to route_to("reviews#destroy", product_id: "1", id: "2")
    end
  end
end
