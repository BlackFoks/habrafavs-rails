require 'spec_helper'

describe Fav do
  subject { Factory.create :fav }

  it { should be_valid }
  its(:habrauser) { should_not be_nil }
  its(:post) { should_not be_nil }

  it "should load favs from page" do
    Post.stub!(:find_or_fetch).and_return(Factory(:post))
    huser = Factory(:habrauser, :slug => "alizar")
    habrauser = Habr::User.find 'alizar'

    Fav.load_from_page(huser, habrauser.favs.pages.first)

    huser.should have_at_least(5).favs
  end
end
