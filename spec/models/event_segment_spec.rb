require 'rails_helper'

RSpec.describe EventSegment, type: :model do

  subject { FactoryGirl.create(:event_segment) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without trip" do
    subject.trip = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without start date" do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without end date" do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end

end
