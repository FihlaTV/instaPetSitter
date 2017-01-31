class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
    @dog_sitters = User.all.includes(:sit_pets).where("sit_pets.pet_kind": "dog")
    @cat_sitters = User.all.includes(:sit_pets).where("sit_pets.pet_kind": "cat")
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    @user.pets.build
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :address, :city, :state, :zip, :phone, :email, :picture, :about_me, :backyard, :preferences, pets_attributes:[:pet_kind, :breed, :size])
    end
end
