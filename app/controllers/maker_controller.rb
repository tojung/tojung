class MakerController < ApplicationController
  # before_action :redirect_root_except_admin, only: %i[show]
  # GET '/maker/:maker_id?product_id='
  before_action :find_maker_or_response
  def show; end

  # POST
  def push_to_maker; end

  private

  def find_maker_or_response
    @maker = Maker.find(params[:maker_id])
    @maker_response = @maker.maker_responses.where(product_id: params[:product_id])
    if @maker_response.empty?
      @maker_response = @maker.maker_responses.create(product_id: params[:product_id],
                                                      name: @maker.name,
                                                      send_count: 0,
                                                      agree_hash: SecureRandom.base64(50),
                                                      disagree_hash: SecureRandom.base64(50)
                                                      )
    else
      @maker_response = @maker_response[0]
    end
  end
end
