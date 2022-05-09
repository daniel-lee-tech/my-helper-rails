# frozen_string_literal: true

class UsersController < ApplicationController
  def signup
    @form = SignupForm.new
  end

  def login
    @form = AuthenticateForm.new
  end

  def authenticate
    @form = AuthenticateForm.new(authenticate_params.to_h)
    if @form.valid?
      user = Sorcery.login(@form.email, @form.plain_text_password)
      if user
        pp 'success'
        pp user
      end
    else

      pp @form
      render 'login', status: :unprocessable_entity
    end
  end

  private

  def authenticate_params
    params.permit(:email, :plain_text_password)
  end
end
