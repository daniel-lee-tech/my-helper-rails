class AuthenticateForm < ApplicationForm

  attr_reader :plain_text_password, :email, :errors

  def initialize(email: '', plain_text_password: '')
    @email = email
    @plain_text_password = plain_text_password
    super()
  end

  def validate
    validate_email
    validate_plain_text_password
  end

  private

  def validate_email
    return nil if @email.match(URI::MailTo::EMAIL_REGEXP)

    @errors[:messages][:email] = []
    @errors[:messages][:email].push('email is not a valid email')
    nil
  end

  def validate_plain_text_password
    return nil if @plain_text_password.length > 8

    @errors[:messages][:plain_text_password] = []
    @errors[:messages][:plain_text_password].push('Password must be longer than 8 characters')
    nil
  end
end
