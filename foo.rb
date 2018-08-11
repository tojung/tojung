class Fooo
  attr_accessor :name, :age, :date_of_birth
  def initialize(attributes={})
    attributes.each do |attribute, value|
      send("#{attribute}=", value)
    end
  end

  def updates(attributes={})
    attributes.each do |attr, value|
      send("#{attr}=", value)
    end
  end
end