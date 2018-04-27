class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # POST /users/import
  def import
    User.import(params[:file])
    redirect_to users_path, notice: "Data Loaded from CSV file."

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
