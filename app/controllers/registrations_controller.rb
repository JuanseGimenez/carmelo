class RegistrationsController < Devise::RegistrationsController

  def update
    current_user.update_with_password(account_update_params)
    redirect_to travels_path
  end

  def deactivate_account
    current_user.active = false
    current_user.deactivation_date = Time.now
    current_user.save
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    redirect_to root_path
  end

  def activate_account
    current_user.active = true
    current_user.deactivation_date = nil
    current_user.save
    redirect_to home_path
  end

  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message! :notice, :destroyed
    yield resource if block_given?
    redirect_to root_path
  end

  private

  def sign_up_params

    params.require(:user).permit( :name, :email, :phone_number, :facebook_image_url,
                                   :birthdate, :location, :gender, :password,
                                   :password_confirmation).merge(oauth)
  end

  def account_update_params
    params.require(:user).permit( :name, :email, :phone_number,
                                  :birthdate, :location, :gender, :password,
                                  :password_confirmation, :current_password)
  end

  def oauth
    if session["devise.facebook_data"].nil?
      {}
    else
      {uid: session["devise.facebook_data"]["uid"], provider: "facebook"}
    end
  end
end