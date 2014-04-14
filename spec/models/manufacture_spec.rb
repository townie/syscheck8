require 'spec_helper'

describe Manufacture do
  it { should have_valid(:name).when('Ford', 'Toyota') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:country).when('USA', 'Japan') }
  it { should_not have_valid(:country).when('', nil) }
end
