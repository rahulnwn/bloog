class Blog
  attr_writer :post_source
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry(entry)
    entries << entry
  end

  def new_post(*args)
    post_source.call(*args).tap do |p|
      p.blog = self
    end
  end

  def title
    "this is title"
  end

  def subtitle
    "this is subtitle"
  end

  private
  def post_source
    @post_source ||= Post.public_method(:new)
  end
end
