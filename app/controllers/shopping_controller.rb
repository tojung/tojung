class ShoppingController < ApplicationController

  # GET /shop
  def index
  end

  # GET /shop/buy
  def buy_form
    if current_vuser != nil and current_vuser.email = "admin@2jung.com"
      @isadmin = true
    end

    @note = Product.find_by_name("나는 투표했다 노트")
    @tissue = Product.find_by_name("잘 뽑았는가 휴지")
    @file = Product.find_by_name("투표는 잘 하셨는가 파일")

  end

  # POST /shop/buy
  def buy
     @orderlog = OrderLog.new

     @orderlog.title = "휴지 팔기"
     @orderlog.order_person = params[:from_person]
     @orderlog.to_person = params[:to_person]

     @orderlog.address = params[:address]
     @orderlog.address_text = params[:address_text]
     @orderlog.address_detail = params[:address_detail]

     @orderlog.phone = params[:phone]
     @orderlog.payer = params[:payer]

     @orderlog.total_price = 0

     @orderlog.save

     @result = {

     }

     if params[:note] != "" and params[:note] != nil
       @note = Product.find_by_name("나는 투표했다 노트")
       @orderdetail = OrderDetail.new
       @orderdetail.order_log_id = @orderlog.id
       @orderdetail.product_id = @note.id
       @orderdetail.num = params[:note].to_i
       @orderdetail.save
       @orderlog.total_price += @note.price * @orderdetail.num
       @orderlog.save
       @note.remain_num -= @orderdetail.num
       @note.save

       @result["note"] = {
           "num"=> params[:note],
           "prices"=> params[:note].to_i * @note.price
       }
     end

     if params[:tissue] != "" and params[:tissue] != nil
       @tissue = Product.find_by_name("잘 뽑았는가 휴지")
       @orderdetail = OrderDetail.new
       @orderdetail.order_log_id = @orderlog.id
       @orderdetail.product_id = @tissue.id
       @orderdetail.num = params[:tissue].to_i
       @orderdetail.save
       @orderlog.total_price += @tissue.price * @orderdetail.num
       @orderlog.save
       @tissue.remain_num -= @orderdetail.num
      @tissue.save
       @result["tissue"] = {
           "num"=> params[:tissue],
           "prices"=> params[:tissue].to_i * @tissue.price
       }
     end

     if params[:file] != "" and params[:file] != nil
       @file = Product.find_by_name("투표는 잘 하셨는가 파일")

       @orderdetail = OrderDetail.new
       @orderdetail.order_log_id = @orderlog.id
       @orderdetail.product_id = @file.id
       @orderdetail.num = params[:file].to_i
       @orderdetail.save
       @orderlog.total_price += @file.price * @orderdetail.num
       @orderlog.save
       @file.remain_num -= @orderdetail.num
       @file.save
       @result["file"] = {
           "num"=> params[:file],
           "prices"=> params[:file].to_i * @tissue.price
       }
     end

  end

end
