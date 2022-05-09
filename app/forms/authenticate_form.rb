class AuthenticateForm < ApplicationForm
  attr_accessor :email
  attr_reader :plain_text_password

  # @param [Hash{Symbol->String}] params
  def initialize(params = { email: '', plain_text_password: '' })
    super()
    @email = params[:email]
    @plain_text_password = params[:plain_text_password]
  end

  def validate
    @errors = { fields: { email: [], plain_text_password: [] } }

    validate_email
    validate_plain_text_password
  end

  private

  def validate_email
    return nil if @email.match(URI::MailTo::EMAIL_REGEXP)

    @errors[:fields][:email].push('email is not a valid email')
  end

  def validate_plain_text_password
    if @plain_text_password.length < 8
      @errors[:fields][:plain_text_password].push('Password must be longer than 8 characters')
    end
  end
end
