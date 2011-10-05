require 'spec_helper'

describe Habrauser do
  subject { Factory(:habrauser, name: 'Alizar') }

  it { should be_valid }
  its(:name) { should == 'Alizar' }
  its(:slug) { should == 'alizar'}
  its(:user) { should_not be_nil }
  its(:habraurl) { should == "http://alizar.habrahabr.ru" }
  its(:status) { should be_nil }
  its(:favs) { should be_empty }

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

  it "should be unique by its slug" do
    first_huser = Factory(:habrauser)
    second_huser = Factory.build(:habrauser, slug: first_huser.slug)
    second_huser.save
    second_huser.should have(1).error_on(:slug)
  end

  it "should be unique by its name" do
    first_huser = Factory(:habrauser)

    # 2nd line -> in order to keep slug unique
    second_huser = Factory.build(:habrauser)
    second_huser.name = first_huser.name
    second_huser.save

    second_huser.should have(1).error_on(:name)
  end

  describe "#status" do
    it "should be nil after creation" do
      huser = Factory(:habrauser, name: 'Alizar')
      huser.status.should be_nil
    end

    it "should return #status value as a symbol" do
      huser = Factory(:habrauser, :status => :processing)

      loaded_huser = Habrauser.find huser.id
      loaded_huser.status.should == :processing
    end
  end

  describe "#fetch" do
    it "should fetch" do
      huser = Factory(:habrauser, :slug => 'alizar', :status => :pending)
      # prevent loading favs from page
      Fav.stub!(:load_from_page).and_return(nil)

      huser.fetch

      huser.status.should == :processing
    end

    it "should fetch only when #status is :pending" do
      huser = Factory(:habrauser)
      huser.fetch
      huser.status.should be_nil
    end
  end
end