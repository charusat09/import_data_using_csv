class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  # GET /users
  # GET /users.json
  def index
    @users = User.filter(params[:name]).order(sort_column + ' ' + sort_direction)
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

  private

  def sort_column
    params[:sort] || "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
