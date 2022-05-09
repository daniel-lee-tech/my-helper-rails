# frozen_string_literal: true

class UsersController < ApplicationController
  def login
    pp 'login'
    @form = AuthenticateForm.new
  end

  def authenticate
    @form = AuthenticateForm.new(authenticate_params.to_h)
    if @form.valid?
      pp 'success'
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
