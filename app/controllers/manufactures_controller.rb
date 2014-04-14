class ManufacturesController < ApplicationController
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

  protected

  def manufacture_params
    params.require(:manufacture).permit(:name, :country)
  end

end
