require 'spec_helper'

describe "posts/edit.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :blog => nil,
      :title => "MyString",
      :content => "MyString",
      :author => nil
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path(@post), :method => "post" do
      assert_select "input#post_blog", :name => "post[blog]"
      assert_select "input#post_title", :name => "post[title]"
      assert_select "input#post_content", :name => "post[content]"
      assert_select "input#post_author", :name => "post[author]"
    end
  end
end
