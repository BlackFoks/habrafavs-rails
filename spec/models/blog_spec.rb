require 'spec_helper'

describe Blog do
  subject { Factory(:blog, :slug => 'ror', :name => "Ruby on Rails") }

  it { should be_valid }
  its(:slug) { should == 'ror' }
  its(:name) { should == 'Ruby on Rails' }
end
