# encoding: UTF-8

# Habrauser#status:
#  * nil - не был выставлен, т.е. добавлен автоматически как автор топика,
#          а не по желанию пользователя
#  * :pending - добавлен пользователем, ожидает обработки
#  * :processing - обрабатывается
#  * :synced - прошел первоначальную обработку
#  * :syncing - синхронизируется повторно, в целях получения недавно добавленных закладок

class Habrauser < ActiveRecord::Base
  belongs_to :user
  has_many :favs

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  after_initialize :init

  def init
    if self.status
      self.status = self.status.intern
    end
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
