class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: %i[ destroy ]

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = product_id

    respond_to do |format|
      if @review.save
        format.html { redirect_to product_url(@review.product_id), notice: "Review was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review/1
  def destroy
    @review.destroy!

    respond_to do |format|
      format.html { redirect_to product_url(product_id), notice: "Review was successfully destroyed." }
    end
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:score, :comment)
  end

  def product_id
    params[:product_id]
  end
end
