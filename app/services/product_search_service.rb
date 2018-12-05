class ProductSearchService
  def initialize(term:)
    @term = term
  end

  def call
    return false unless valid_term?

    term_cover_per = "%#{@term}%"

    @result = Product.where(search_query_string,
                            term_cover_per,
                            term_cover_per,
                            term_cover_per,
                            term_cover_per,
                            term_cover_per)
  end

  private

  def valid_term?
    @term != '' && !@term.nil?
  end

  def search_query_string
    'name LIKE ? OR
     subname LIKE ? OR
     video_text LIKE ? OR
     assos LIKE ? OR
     bill_name LIKE ?'
  end
end
