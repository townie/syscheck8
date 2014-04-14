require 'spec_helper'

feature 'Car salesperson records a car', %q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

#   Acceptance Criteria:

# I must specify the color, year, and mileage of the car.
# Only years from 1980 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information in the required formats, the car is recorded.
# If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# Upon successfully creating a car, I am redirected so that I can create another car.

  scenario "I must specify the color, year, and mileage of the car." do
    visit new_car_path

    fill_in "Color", with: "Yellow"
    fill_in "Year", with: "1999"
    fill_in "Mileage", with: "15000"

    click_on "Create Car"

    expect(page).to have_content("New car created")
  end

  scenario "Only years from 1980 and above can be specified." do
    visit new_car_path

    fill_in "Color", with: "Yellow"
    fill_in "Year", with: "1925"
    fill_in "Mileage", with: "15000"
    click_on "Create Car"

    expect(page).to have_content("must be greater than or equal to 1980")
  end

  scenario "I can optionally specify a description of the car." do
    visit new_car_path

    fill_in "Color", with: "Yellow"
    fill_in "Year", with: "1999"
    fill_in "Mileage", with: "15000"
    fill_in "Description", with: "sick whip"
    click_on "Create Car"

    expect(page).to have_content("New car created")
  end

  scenario "If I enter all of the required information in the required formats, the car is recorded." do
    prev_count = Car.count
    visit new_car_path

    fill_in "Color", with: "Yellow"
    fill_in "Year", with: "1999"
    fill_in "Mileage", with: "15000"
    fill_in "Description", with: "sick whip"
    click_on "Create Car"

    expect(page).to have_content("New car created")
    expect(Car.count).to eq(prev_count + 1)
  end

  scenario "If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors." do
    prev_count = Car.count
    visit new_car_path

    fill_in "Color", with: "Yellow"
    fill_in "Year", with: "1999"
    fill_in "Mileage", with: ""
    fill_in "Description", with: "sick whip"
    click_on "Create Car"

    expect(page).to have_content("can't be blank")
    expect(Car.count).to eq(prev_count)
  end

  scenario "Upon successfully creating a car, I am redirected so that I can create another car." do
    prev_count = Car.count
    visit new_car_path

    fill_in "Color", with: "Yellow"
    fill_in "Year", with: "1999"
    fill_in "Mileage", with: "150000"
    fill_in "Description", with: "sick whip"
    click_on "Create Car"

    expect(page).to have_content("Color")
    expect(page).to have_content("Year")
    expect(page).to have_content("Mileage")
    expect(page).to have_content("Create new car")
    expect(Car.count).to eq(prev_count + 1)
  end

  scenario "User can see all cars" do
    visit new_car_path

    fill_in "Color", with: "Yellow"
    fill_in "Year", with: "1999"
    fill_in "Mileage", with: "150000"
    fill_in "Description", with: "sick whip"
    click_on "Create Car"

    visit cars_path

    expect(page).to have_content("Yellow")
    expect(page).to have_content("1999")
    expect(page).to have_content("sick whip")
  end

end
