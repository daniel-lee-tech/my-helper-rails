class ApplicationForm
  attr_accessor :errors

  def initialize
    super
    @errors = { fields: {} }
  end

  def validate
    @errors = { fields: {} }
    raise('Abstract method, implement')
  end

  def field_error(field)
    @errors[:fields][field] ||= []
  end

  def valid?
    validate
    @errors[:fields].empty?
  end
end
