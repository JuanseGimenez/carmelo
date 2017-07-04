require 'rails_helper'

RSpec.describe Post, type: :model do

  subject { FactoryGirl.create(:post) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without trip" do
    subject.trip = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

end
