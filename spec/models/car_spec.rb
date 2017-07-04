require 'rails_helper'

RSpec.describe Car, type: :model do

  subject { FactoryGirl.create(:car) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user" do
    subject.owner = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without model" do
    subject.model = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without year" do
    subject.year = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without places" do
    subject.places = nil
    expect(subject).to_not be_valid
  end

end
