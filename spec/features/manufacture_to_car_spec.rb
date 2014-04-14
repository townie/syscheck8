require 'spec_helper'

feature 'car get an manufacture', %q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
 } do
  #   Acceptance Criteria:
  # I must specify a manufacturer name and country.
  # If I do not specify the required information, I am presented with errors.
  # If I specify the required information, the manufacturer is recorded and I am redirected to enter another new manufacturer.

  scenario 'I must specify a manufacturer name and country.' do
    visit new_manufacture_path

    fill_in "Name", with: "Ford"
    select("USA", from: "Country")
    click_on "Create Manufacture"

    expect(page).to have_content("New manufacture created")
  end

  scenario 'If I do not specify the required information, I am presented with errors.' do
    visit new_manufacture_path

    fill_in "Name", with: ""
    select("USA", from: "Country")
    click_on "Create Manufacture"

    expect(page).to have_content("can't be blank")
  end

  scenario 'If I specify the required information, the manufacturer is recorded and I am redirected to enter another new manufacturer.' do
    prev_count = Manufacture.count
    visit new_manufacture_path

    fill_in "Name", with: "Ford"
    select("USA", from: "Country")
    click_on "Create Manufacture"

    expect(Manufacture.count).to eq(prev_count + 1)
  end

end
