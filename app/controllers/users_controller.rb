class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Uspješno ste se registrirali! Email dobrodošlice Vam uskoro stiže. Nakon što administrator potvrdi Vaš račun moći ćete koristiti aplikaciju.'
      @user.deliver_welcome_email!
      @user.deliver_verification_instructions!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id]) || current_user
    p params
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.json { respond_with_bip(@user) }
      else
        format.json { respond_with_bip(@user) }
      end
    end
  end

  def change_password
    @user = current_user
    if @user.valid_password?(params[:user][:current_password]) && @user.update(user_params)
      UserSession.create(username: @user.username, password: @user.password)
      flash[:notice] = change_password_notice
      redirect_to user_path(@user)
    else
      flash.now[:error] = change_password_error if change_password_error
      render :edit
    end
  end

  private

  def change_password_notice
    'Successfully updated password.'
  end
  def change_password_error
    if !@user.valid_password? params[:user][:current_password]
      'Current password not valid.'
    end
  end
end
