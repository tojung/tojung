class SearchApiController < ApplicationController
  def products
    res = ProductSearchService.new(term: params[:term]).call

    render json: {
      products: res.as_json
    }
  end
end
