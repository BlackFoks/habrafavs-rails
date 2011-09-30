require 'spec_helper'

describe "favs/show.html.erb" do
  before(:each) do
    @fav = assign(:fav, stub_model(Fav,
      :user => nil,
      :post => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
