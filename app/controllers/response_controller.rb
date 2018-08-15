class ResponseController < ApplicationController
  # GET '/agree?key='
  def agree
    @key = params[:key]
    @maker_response = MakerResponse.where(agree_hash: @key)
    if @maker_response.empty?
      redirect_root
      return
    end
    @maker_response.update(response_type: "찬성")
  end

  # GET '/disagree?key='
  def disagree
    @key = params[:key]
    @maker_response = MakerResponse.where(disagree_hash: @key)
    if @maker_response.empty?
      redirect_root
      return
    end
    @maker_response.update(response_type: "반대")
  end

  # POST '/discuss'
  def discuss
    # type, mr_id, key
    if params[:type] == "agree"
      maker_response = MakerResponse.where(id: params[:mr_id], agree_hash: params[:key])
      if maker_response.empty?
        redirect_root
        return
      end
      maker_response.update(response_text: params[:content])
    else
      maker_response = MakerResponse.where(id: params[:mr_id], disagree_hash: params[:key])
      if maker_response.empty?
        redirect_root
        return
      end
      maker_response.update(response_text: params[:content])
    end
    redirect_root
  end

end
