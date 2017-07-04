require 'rails_helper'

RSpec.describe Trip, type: :model do

  subject { FactoryGirl.create(:trip) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user" do
    subject.owner = nil
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

  it "is not valid without end date" do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid start date inferior to current date" do
    subject.start_date = Time.now - 1.day
    expect(subject).to_not be_valid
  end

  it "is not valid start date superior to end date" do
    subject.start_date = Time.now + 2.day
    subject.end_date = Time.now - 1.day
    expect(subject).to_not be_valid
  end

end
