require 'rails_helper'

RSpec.describe "reviews/show", type: :view do
  before(:each) do
    assign(:review, Review.create!(
      review: 2,
      comment: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
