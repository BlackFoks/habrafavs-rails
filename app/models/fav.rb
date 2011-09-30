class Fav < ActiveRecord::Base
  belongs_to :habrauser
  belongs_to :post
end
