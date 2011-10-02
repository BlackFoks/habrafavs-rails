require 'spec_helper'

describe "favs/index.html.erb" do
  before(:each) do
    @habrauser = stub_model(Habrauser, :name => "Alizar")
    @post = stub_model(Post, :title => "Title")

    assign(:favs, [
      stub_model(Fav, :habrauser => @habrauser, :post => @post),
      stub_model(Fav, :habrauser => @habrauser, :post => @post)
    ])
  end

  it "renders a list of favs" do
    render
    assert_select "tr>td>a", :text => @habrauser.name, :count => 2
    assert_select "tr>td>a", :text => @post.title, :count => 2
  end
end
