require 'rails_helper'

RSpec.describe Relationship, type: :model do

  subject { FactoryGirl.create(:relationship) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without subscriber" do
    subject.subscriber = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without trip" do
    subject.trip = nil
    expect(subject).to_not be_valid
  end

end