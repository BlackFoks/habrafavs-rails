class Habrauser < ActiveRecord::Base
  belongs_to :user
  has_many :favs

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  after_initialize :init

  def init
    self.status ||= :pending
    self.status = self.status.intern
  end

  def habraurl
    "http://#{self.slug}.habrahabr.ru"
  end

  def name_to_slug
    Habr::Helper.name_to_slug self.name
  end

  def fetch
    return if self.status != :pending

    huser = Habr::User.find self.slug
    huser.favs.pages.each do |page|
      Fav.delay.load_from_page(self, page)
    end

    self.status = :processing
    self.save
  end
end
