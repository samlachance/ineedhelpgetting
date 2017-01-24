class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.create(city_params)

    if @city.save
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  def show
    # There is def a better way to do this. This is temporary so I can carry on with my work
    @city = City.where(name: params[:name]).first
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])

    if @city.update(city_params)
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy

    redirect_to action: "index"
  end

  private

    def city_params
      params.require(:city).permit(:name, :state_id)
    end
end
