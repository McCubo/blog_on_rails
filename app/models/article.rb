class Article < ApplicationRecord
	validates_presence_of :title
	validates_presence_of :body, :on => :save, :message => "You should type some text"
	
	belongs_to :user
	has_and_belongs_to_many :categories
	has_many :comments
	
	scope :published, lambda { where("articles.published_at IS NOT NULL") }
	scope :draft, lambda { where("articles.published_at IS NULL") } 
	scope :recent, lambda { published.where("articles.published_at >= :a_week_ago", {:a_week_ago => 1.week.ago.to_date }) }
	scope :where_title, lambda { |term| where("articles.title LIKE :term", {:term => "%#{term}%"}) }
	
	def long_title
	  "#{title} - #{published_at}"
	end
	
	def published?
	  published_at.present?
	end
	
	def owned_by?(owner)
	  return false unless owner.is_a?(User)
	  user == owner
	end
end
