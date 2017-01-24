class ClientsController < ApplicationController
  def index
  end
  
  def new
    @client = Client.new
  end

  def create
    @client = Client.create(client_params)

    if @client.save
      @client.attach_to_need(session[:need_id])
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  private
  def client_params
    params.require(:client).permit(:name, :phone, :email)
  end
end
