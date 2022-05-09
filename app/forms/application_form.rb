class ApplicationForm
  attr_accessor :errors

  def initialize
    super() # call super last in initialization in subclasses
    validate_initialization!
  end

  def validate
    raise('Abstract method, implement')
  end

  def field_error(field)
    @errors[:fields][field]
  end

  def valid?
    validate
    @errors[:fields].empty?
  end

  private

  def validate_initialization!
    raise '@errors must be a hash' unless @errors.is_a?(Hash)
    raise '@errors[:fields] must be a hash' unless @errors[:fields].is_a?(Hash)
    raise 'Populate @errors[:fields] with field names and empty arrays' if @errors[:fields].empty?

    @errors[:fields].each_pair do |_key, value|
      raise '@errors[:fields] must hold empty arrays on initialization' unless value.is_a?(Array) and value.empty?
    end
  end
end
