require 'spec_helper'

describe Post do
  subject { Factory(:post, :title => "Post Title") }

  it { should be_valid }
  its(:blog) { should_not be_nil }
  its(:title) { should == "Post Title" }
  its(:content) { should_not be_nil }
  its(:published_at) { should_not be_nil }
  its(:author) { should_not be_nil }
end
