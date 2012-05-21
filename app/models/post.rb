class Post
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  validates :title, presence: true

  attr_accessor :blog, :title, :body, :pubdate

  def initialize(attrs={})
    attrs.each { |k,v| send("#{k}=", v) }
  end

  def publish(clock = DateTime)
    return false unless valid?
    self.pubdate = clock.now
    blog.add_entry(self)
  end

  def persisted?
    false
  end
end
