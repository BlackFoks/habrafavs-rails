# encoding: UTF-8
require 'spec_helper'

describe Post do
  subject { Factory(:post, :title => "Post Title") }

  it { should be_valid }
  its(:blog) { should_not be_nil }
  its(:title) { should == "Post Title" }
  its(:content) { should_not be_nil }
  its(:published_at) { should_not be_nil }
  its(:author) { should_not be_nil }
  its(:favs) { should be_empty }

  describe "using #find_or_fetch" do
    it "should fetch" do
      post = Post.find_by_habraid(12743)
      post.should be_nil

      post = Post.find_or_fetch(12743)
      post.blog.slug.should == 'cyberpunk'
      post.blog.name.should == 'Киберпанк'
      post.title.should == 'Нижнее бельё с защитой от папарацци'
      post.author.name.should == 'Tylerskald'
    end

    it "should find" do
      post = Factory(:post, :title => "Post Title")

      post1 = Post.find_by_habraid(post.habraid)
      post2 = Post.find_or_fetch(post.habraid)

      post1.should eq(post2)
    end
  end
end
