require 'rails_helper'

RSpec.describe User, type: :model do

  subject { FactoryGirl.create(:user) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a location" do
    subject.location = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a gender" do
    subject.gender = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a birthdate" do
    subject.birthdate = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a phone number" do
    subject.phone_number = nil
    expect(subject).to_not be_valid
  end

end
