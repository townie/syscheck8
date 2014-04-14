require 'spec_helper'

describe Car do
  it { should have_valid(:color).when('yellow', 'black') }
  it { should_not have_valid(:color).when('', nil) }

  it { should have_valid(:year).when('1980', '2015') }
  it { should_not have_valid(:year).when('', nil, '1979', '2016') }

  it { should have_valid(:mileage).when('1','500000') }
  it { should_not have_valid(:mileage).when('', nil, '0', '-1', '1000000') }
end
