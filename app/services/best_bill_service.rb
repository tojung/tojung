class BestBillService
  def initialize(params: params)
    @params = params
  end

  def read_bill
    raise 'params is nil' if @params.nil?
    _read_bill_by_id(@params[:id])
  end

  def reads_maker
    read_bill if @bill.nil?
    _reads_maker_by_bill(@bill)
  end

  private

  def _read_bill_by_id(bill_id)
    @bill = BestBill.find(bill_id)
  end

  def _reads_maker_by_bill(bill)
    @makers = Maker.where(assos: bill.assos)
  end
end
