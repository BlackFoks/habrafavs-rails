require 'spec_helper'

describe "blogs/index.html.erb" do
  before(:each) do
    assign(:blogs, [
      stub_model(Blog,
        :slug => "Slug",
        :name => "Name"
      ),
      stub_model(Blog,
        :slug => "Slug",
        :name => "Name"
      )
    ])
  end

  it "renders a list of blogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
