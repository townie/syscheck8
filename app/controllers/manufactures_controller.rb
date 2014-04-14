class ManufacturesController < ApplicationController
  def index
    @manufactures = Manufacture.all
  end

  def new
    @manufacture = Manufacture.new
  end

  def create
    @manufacture = Manufacture.new(manufacture_params)

    if @manufacture.save
      redirect_to new_manufacture_path, notice: "New manufacture created"
    else
      render 'new', notice: "Please enter valid info"
    end
  end

  def update
    @manufacture = Manufacture.find(params[:id])

  end

  def update
    @manufacture = Manufacture.find(params[:id])
    if @manufacture.update(manufacture_params)
      redirect_to @manufacture, notice: 'Manufacture was successfully updated.'
    else
      render 'index'
    end

  end


  def destroy
    @manufacture = Manufacture.find(params[:id])
    @manufacture.destroy
    redirect_to manufactures_path
  end

  protected

  def manufacture_params
    params.require(:manufacture).permit(:name, :country)
  end

end
