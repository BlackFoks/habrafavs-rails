class Habrauser < ActiveRecord::Base
  belongs_to :user

  def habraurl
    "http://#{self.slug}.habrahabr.ru"
  end
end
