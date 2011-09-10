require 'spec_helper'

describe User do
  subject do 
    Factory(:user, name: 'blackfoks', password: 'secret', email: 'blackfoks@gmail.com')
  end
  
  it { should be_valid }
  its(:name) { should == 'blackfoks'}
  its(:email) { should == 'blackfoks@gmail.com' }
  its(:habrausers) { should be_empty }
  
  it "should not be valid without name" do
    newbie = Factory.build(:user, name: '')
    newbie.should_not be_valid
    newbie.name = 'newbie'
    newbie.should be_valid
  end
  
  it "should not be valid without email" do
    newbie = Factory.build(:user, email: '')
    newbie.should_not be_valid
    newbie.email = 'newbie@example.com'
    newbie.should be_valid
  end
  
  it "should have unique name" do
    newbie1 = Factory.build(:user)
    newbie2 = Factory.build(:user, name: newbie1.name)
    newbie1.save.should be_true
    newbie2.save.should be_false
  end  
end