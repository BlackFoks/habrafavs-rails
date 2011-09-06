class Habrauser < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :slug

  def habraurl
    "http://#{self.slug}.habrahabr.ru"
  end

  def name_to_slug
    self.name.downcase
  end
end
