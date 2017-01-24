class NeedsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @need = Need.new
  end

  def create
    @need = Need.create(need_params)

    if @need.save
      # redirect_to new client
      session[:need_id] = @need.id
      redirect_to controller: "clients", action: "new"
    else
      render 'edit'
    end
  end

  private
    def need_params
      params.require(:need).permit(:client_id, :city_id, :item_id, :name)
    end
end
