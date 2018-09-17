class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :package
  has_one :product_order_detail
  has_one :product_delivery

  def self.create_order_infos(product_order_params,
                              product_order_detail_params,
                              product_delivery_params,
                              send_email_content,
                              user_email,
                              user_id)
    product_order = ProductOrder.create(product_order_params)
    product_delivery = ProductDelivery.create(product_delivery_params)
    product_order_detail = ProductOrderDetail.create(product_order_detail_params)

    product_order.update_attributes(product_order_detail_id: product_order_detail.id,
                                    product_delivery_id: product_delivery.id)
    product_order_detail.update_attributes(product_order_id: product_order.id,
                                           product_delivery_id: product_delivery.id)
    product_delivery.update_attributes(product_order_id: product_order.id,
                                       product_order_detail_id: product_order_detail.id)

    product = Product.find(product_order.product.id)
    product.funded_count += 1 if product.funded_count != nil
    product.save
    if user_id == 1
      return
    end
    product.maker_responses.each do |maker_res|
      content = "안녕하세요, #{maker_res.maker.name}의원님!
#{maker_res.product.assos}에 계류중인
#{maker_res.product.bill_id}의안인
          '#{maker_res.product.bill_name}'이 왜 통과되지않는지 궁금합니다.의원님은 이 입법안에 대해 어떤 의견을 가지고 계시나요? 이 입법을 꼭 빠르게 추진해주세요.
이메일 청원합니다.\n\n#{send_email_content}"
      MakerMailer.simple_send(user_email,
                              maker_res.maker.email,
                              "#{product.assos}에 계류중인 #{product.bill_id}의안인 '#{product.bill_name}'이 왜 통과되지않나요?",
                              content,
                              maker_res.agree_hash,
                              maker_res.disagree_hash).deliver_later
      maker_res.send_count += 1
      maker_res.save
      Sendlog.create(from_email: user_email,
                     to_email: maker_res.maker.email,
                     user_id: user_id,
                     content: content,
                     title: "#{product.assos}에 계류중인 #{product.bill_id}의안인 '#{product.bill_name}'이 왜 통과되지않나요?")
    end
  end
end
