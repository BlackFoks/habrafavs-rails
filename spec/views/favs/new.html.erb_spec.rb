require 'spec_helper'

describe "favs/new.html.erb" do
  before(:each) do
    assign(:fav, stub_model(Fav,
      :user => nil,
      :post => nil
    ).as_new_record)
  end

  it "renders new fav form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => favs_path, :method => "post" do
      assert_select "input#fav_user", :name => "fav[user]"
      assert_select "input#fav_post", :name => "fav[post]"
    end
  end
end
