require 'spec_helper'

describe "posts/show.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :blog => stub_model(Blog, :name => "Ruby on Rails"),
      :title => "Title",
      :content => "Content",
      :author => stub_model(Habrauser, :name => "Alizar")
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Ruby on Rails/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Alizar/)
  end
end
