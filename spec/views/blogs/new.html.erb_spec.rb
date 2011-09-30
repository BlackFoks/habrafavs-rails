require 'spec_helper'

describe "blogs/new.html.erb" do
  before(:each) do
    assign(:blog, stub_model(Blog,
      :slug => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new blog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blogs_path, :method => "post" do
      assert_select "input#blog_slug", :name => "blog[slug]"
      assert_select "input#blog_name", :name => "blog[name]"
    end
  end
end
