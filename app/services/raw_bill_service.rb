class RawBillService
  def initialize; end

  def self.find(id:)
    return nil unless Rails.env.production?

    bill = Bill.find(id)
  end
end