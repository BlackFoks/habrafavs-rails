class Habrauser < ActiveRecord::Base
  belongs_to :user
  has_many :favs

  after_initialize :init

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  def init
    if self.status
      self.status = self.status.intern
    else
      self.status ||= :pending
    end
  end

  def habraurl
    "http://#{self.slug}.habrahabr.ru"
  end

  def name_to_slug
    Habr::Helper.name_to_slug(self.name) #self.name.downcase
  end
end
