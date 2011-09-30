require 'spec_helper'

describe "favs/index.html.erb" do
  before(:each) do
    assign(:favs, [
      stub_model(Fav,
        :user => nil,
        :post => nil
      ),
      stub_model(Fav,
        :user => nil,
        :post => nil
      )
    ])
  end

  it "renders a list of favs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
