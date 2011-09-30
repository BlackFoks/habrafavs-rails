require 'spec_helper'

describe "blogs/show.html.erb" do
  before(:each) do
    @blog = assign(:blog, stub_model(Blog,
      :slug => "Slug",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Slug/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
