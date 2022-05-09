class SignupForm < ApplicationForm
  def initialize(_test = 'test')
    @errors = { fields: { email: [], password: [], password_confirmation: [], terms_of_condition: [], newsletter: [] } }

    super()
  end
end
