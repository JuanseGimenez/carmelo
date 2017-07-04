require 'rails_helper'

RSpec.describe Friendship, type: :model do

  subject { FactoryGirl.create(:friendship) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without friend" do
    subject.friend = nil
    expect(subject).to_not be_valid
  end

end