require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        review: 2,
        comment: "MyText"
      ),
      Review.create!(
        review: 2,
        comment: "MyText"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
