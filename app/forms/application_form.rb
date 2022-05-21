class ApplicationForm
  attr_accessor :errors

  def initialize
    @errors = { messages: {} }
    super() # call super last in initialization in subclasses
    validate_initialization!
  end

  def validate
    raise NotImplementedError('Abstract method, implement')
    nil
  end


  def valid?
    validate
    @errors[:messages].empty?
  end

  private

  def validate_initialization!
    raise '@errors must be a hash' unless @errors.is_a?(Hash)
    raise '@errors[:fields] must be a hash' unless @errors[:messages].is_a?(Hash)
    nil
  end
end


