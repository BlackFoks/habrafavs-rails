class Habrauser < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  def habraurl
    "http://#{self.slug}.habrahabr.ru"
  end

  def name_to_slug
    Habr::Helper.name_to_slug(self.name) #self.name.downcase
  end
end
