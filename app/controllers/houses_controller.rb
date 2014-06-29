class HousesController < ApplicationController
  before_filter :get_house, :only => [:edit, :update, :destroy]

  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def edit
  end

  def create
    @house = House.new(house_params)

    if @house.save
      redirect_to root_path
    else
      redirect_to new_houses_path
    end
  end

  def update
    if @house.update(house_params)
      redirect_to houses_path, notice: 'House was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @house.destroy
    redirect_to root_path, notice: 'House was successfully destroyed.'
  end

  private
    def house_params
      params.require(:house).permit(
        :name,
        :price,
        :location,
        :owner
      )
    end

    def get_house
      @house = House.find(params[:id])
    end
end
