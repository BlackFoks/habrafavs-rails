require 'spec_helper'

describe Fav do
  subject { Factory.create :fav }
  
  it { should be_valid }
  its(:habrauser) { should_not be_nil }
  its(:post) { should_not be_nil }  
end
