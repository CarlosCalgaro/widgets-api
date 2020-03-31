class Api::V1::UsersController < ApplicationController

  def show
    service = Users::FindService.new
    response = service.perform(params[:id], current_token)
    if response.success?
      @data = response.body
      render_success()
    else
      render_error(code: response.code, message: response.message)
    end
  end
  
  def widgets
    term = params.has_key?(:term) ? params[:term] : ""
    service = Users::Widgets::IndexService.new
    response = service.perform(term, current_token)
    if response.success?
        @widgets = response.body
        render_success
    else
        render_error(code: response.code, message: response.message)
    end
  end
  
  def create
    service = Users::CreateService.new
    response = service.perform(user_params)
    if response.success?
      @user = response.body
      render_success()
    else
      render_error(code: response.code, message: response.message)
    end
  end

  def update_password
    service = Users::UpdatePasswordService.new
    response = service.perform(update_password_params[:current_password], update_password_params[:new_password], current_token)
    if response.success?
      @data = response.body
      render_success()
    else
      render_error(code: response.code, message: response.message)
    end 
  end
  
  def me
    service = Users::MeService.new
    response = service.perform(current_token)
    if response.success?
      @data = response.body
      render_success()
    else
      render_error(code: response.code, message: response.message)
    end 
  end
  
  def reset_password
    service = Users::ResetPasswordService.new
    response = service.perform(user_params[:email])
    if response.success?
      render_success(message: response.message)
    else
      render_error(code: response.code, message: response.message)
    end
  end

  def update
    service = Users::UpdateService.new
    response = service.perform(current_token, user_params)
    if response.success?
      @user = response.body
      render_success(message: response.message)
    else
      render_error(code: response.code, message: response.message)
    end
  end

  private

  def update_password_params
    params.require(:user).permit(:current_password, :new_password)
  end
  
  def user_params 
    params.require(:user).permit(:first_name, :last_name, :password, :email, :date_of_birth, :image_url)
  end

end
