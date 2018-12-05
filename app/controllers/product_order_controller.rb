class ProductOrderController < ApplicationController
  def new
    read_product
    read_package
    read_user_infos
    read_phone_case
  end

  def create
    read_product
    read_package
    read_user_infos
    action_service = ProductOrderFullService.new(params: params,
                                                 user_id: @user_id,
                                                 user_email: @user_email)
    action_service.call

    @status = action_service.status
    @product_order_id = action_service.product_order_id
  end

  private

  def read_package
    @package = PackageService.new(params).package
  end

  def read_product
    @product = ProductService.new(params).product
  end

  def read_phone_case
    @jellycases = StaticValueService.new.jelleycases
    @hardcases = StaticValueService.new.hardcases
  end
end
