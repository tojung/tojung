class PackageService
  def initialize(params)
    @params = params
  end

  # @return [Package]
  def package
    @package = Package.find(@params[:package_id])
  end
end
