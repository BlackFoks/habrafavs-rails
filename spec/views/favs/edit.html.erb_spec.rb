require 'spec_helper'

describe "favs/edit.html.erb" do
  before(:each) do
    @fav = assign(:fav, stub_model(Fav,
      :user => nil,
      :post => nil
    ))
  end

  it "renders the edit fav form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => favs_path(@fav), :method => "post" do
      assert_select "input#fav_user", :name => "fav[user]"
      assert_select "input#fav_post", :name => "fav[post]"
    end
  end
end
