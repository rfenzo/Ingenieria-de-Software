class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:edit,:update,:destroy]
  
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'El usuario ha sido removido satisfactoriamenteed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'El usuario ha sido actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:admin)
    end

    def is_admin?
      if not current_user.admin?
        redirect_to users_url, notice: 'No tienes permiso para modificar el perfil de otro usuario'
      end
    end
end
