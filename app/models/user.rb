class User < ApplicationRecord
  has_one :profile,-> { order ("email desc") }, :dependent => :destroy
  has_many :articles, -> { order ("published_at desc, title asc") }, :dependent => :destroy
  has_many :replies, :through => :articles, :source => :comments
end
