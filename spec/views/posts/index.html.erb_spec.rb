require 'spec_helper'

describe "posts/index.html.erb" do
  before(:each) do
    @blog = stub_model(Blog, :slug => "ror", :name => "Ruby on Rails")
    @author = stub_model(Habrauser, :slug => "alizar", :name => "Alizar")

    assign(:posts, [
      stub_model(Post, :blog => @blog, :title => "Title", :author => @author),
      stub_model(Post, :blog => @blog, :title => "Title", :author => @author)
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td>a", :text => @blog.name, :count => 2
    assert_select "tr>td>a", :text => "Title".to_s, :count => 2
    assert_select "tr>td>a", :text => @author.name, :count => 2
  end
end
