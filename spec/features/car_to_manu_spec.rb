require 'spec_helper'

feature 'car has a manufacture', %q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
} do
  # Acceptance Criteria:

  # When recording a car listing, I want to optionally associate it with its manufacturer.
  # If I delete a manufacturer, the manufacturer and its primary key should no longer be associated with any car listings.

  scenario 'When recording a car listing, I want to optionally associate it with its manufacturer.' do
    manu = FactoryGirl.create(:manufacture)
    car = FactoryGirl.create(:car, manufacture: manu)

    visit cars_path
    expect(page).to have_content(manu.name)
  end

  scenario 'If I delete a manufacturer, the manufacturer and its primary key should no longer be associated with any car listings.' do
    manu = FactoryGirl.create(:manufacture)
    car = FactoryGirl.create(:car, manufacture: manu)

    visit manufactures_path

    click_on "Destroy #{manu.name}"
    expect(Car.last.manufacture_id).to eq(nil)
  end
end
