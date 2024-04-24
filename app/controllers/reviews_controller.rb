class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: %i[ destroy ]
  before_action :check_owner, only: [:destroy]

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
        format.html { redirect_to product_url(@review.product_id), notice: "Error." }
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

  def check_owner
    unless @review.user == current_user
      respond_to do |format|
        format.html { redirect_to product_url(product_id), notice: "Is not your review." }
      end
    end
  end
end
