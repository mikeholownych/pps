class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  attr_accessible :title, :body, :published, :author, :author_id

  belongs_to :author, class_name: "AdminUser"

  validates_presence_of :body, :title

  scope :published, -> { where(published: true) }

  def content
    MarkdownService.new.render(body)
  end

  def author_name
    if author
      author.name
    else
      "Nobody"
    end
  end

end
