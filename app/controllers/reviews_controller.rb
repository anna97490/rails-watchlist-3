class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to list_path(@review)
  end

  def destroy
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
