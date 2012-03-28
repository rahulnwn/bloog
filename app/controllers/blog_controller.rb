class BlogController < ApplicationController
  def index
    @blog = Blog.new
    post1 = @blog.new_post
    post1.title = "this is a post title"
    post1.body = "this is a post body"
    post1.publish
    post2 = @blog.new_post(title: "this is another post title")
    post2.body = "Body body"
    post2.publish
  end
end
