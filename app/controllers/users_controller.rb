# frozen_string_literal: true

class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def create
    @user = User.new(
      email: signup_params[:email],
      password: signup_params[:password],
      password_confirmation: signup_params[:password_confirmation]
    )

    if @user.valid?
      @user = User.create(email: @user.email, password: @user.password, password_confirmation: @user.password_confirmation)
      render 'login'
    else
      pp 'not valid'
      pp @user.errors.full_messages
      render 'signup', status: :unprocessable_entity
    end

  end

  def login
    @form = AuthenticateForm.new
  end

  def authenticate
    @form = AuthenticateForm.new(email: auth_params[:email], plain_text_password: auth_params[:plain_text_password])
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

  def auth_params
    params.permit(:email, :plain_text_password)
  end

  def signup_params
    params.require('user').permit(:email, :password, :password_confirmation, :terms_of_condition, :newsletter)
  end
end
