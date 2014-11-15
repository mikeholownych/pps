class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :post, :body
  attr_accessible :body
end
