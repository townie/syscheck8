class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    @cars = [Car.find(params[:id])]
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])

  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to new_car_path, notice: "New car created"
    else
      render 'new', notice: "Please enter valid info"
    end

  end

   def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      render 'index'
    end

  end


  protected

  def car_params
    params.require(:car).permit(:year, :color, :description, :mileage, :manufacture_id)
  end

end
