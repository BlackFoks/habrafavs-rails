require 'spec_helper'

describe Habrauser do
  subject { Factory(:habrauser, name: 'Alizar') }
  
  it { should be_valid }
  its(:name) { should == 'Alizar' }
  its(:slug) { should == 'alizar'}
  its(:user) { should_not be_nil }
  its(:habraurl) { should == "http://alizar.habrahabr.ru" }
  
  it "should not be valid without name" do
    huser = Factory.build(:habrauser, name: '', slug: 'xaoccps')
    huser.should_not be_valid
    huser.name = 'XaocCPS'
    huser.should be_valid    
  end
  
  it "should not be valid without slug" do
    huser = Factory.build(:habrauser, slug: '')
    huser.should_not be_valid
    huser.slug = 'huser123'
    huser.should be_valid
  end
  
  it "should get slug by name for chars and digits" do
    huser = Factory.build(:habrauser, name: 'XaocCPS256')
    huser.slug.should == 'xaoccps256'
  end
end