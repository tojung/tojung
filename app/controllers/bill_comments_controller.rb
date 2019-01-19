class BillCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    BillCommentService.new(params).create(user: current_user)

    redirect_to "/best/#{params[:best_bill_id]}#comment"
  end

  def destroy
    BillCommentService.destroy(user: current_user, params: params)

    redirect_to "/best/#{params[:best_bill_id]}#comment"
  end

  def update; end
end