class ChefsController < ApplicationController
  before_action :set_chef, only: [:destroy, :update, :show, :edit]
  before_action :require_same_user, only: [:destroy, :edit, :update]

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      session[:chef_id] = @chef.id
      flash[:success] = "Welcome #{@chef.chefname} to MyRecipes App!"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      flash[:success] = "Your profile was updated successfully!"
      redirect_to @chef
    else
      render 'edit'
    end
  end

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @chef.destroy
    flash[:danger] = "Chef and all associated recipes have been deleted"
    redirect_to chefs_path
  end

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
  end

  def require_same_user
    if current_chef != @chef
      flash[:danger] = "you can only edit and delete your own account!"
      redirect_to chefs_path
    end
  end
end
