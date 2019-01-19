class BillCommentService
  def initialize(params)
    @params = params
  end

  def create(user:)
    user.bill_comments.create(create_params)
  end

  def self.comments(best_bill_id:)
    BillComment.where(best_bill_id: best_bill_id).reverse_order
  end

  def self.destroy(user:, params:)
    comment = BillComment.find(params[:id])

    return false if user.id != comment.user.id

    comment.destroy
    true
  end

  private

  def create_params
    @params.permit(:user_id, :content, :best_bill_id)
  end
end
