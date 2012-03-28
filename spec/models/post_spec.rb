require 'minitest/autorun'
require_relative '../../app/models/post'

describe Post do
  before do
    @it = Post.new
  end

  it "starts with blank attribues" do
    @it.title.must_be_nil
    @it.body.must_be_nil
  end

  it "supports reading and writing a title" do
    @it.title = "some title"
    @it.title.must_equal "some title"
  end

  it "supports reading and writing a post body" do
    @it.title = "some body"
    @it.title.must_equal "some body"
  end

  it "supports reading and writing a blog reference" do
    blog = Object.new
    @it.blog = blog
    @it.blog.must_equal blog
  end

  describe "#publish" do
    before do
      @blog = MiniTest::Mock.new
      @it.blog = @blog
    end

    after do
      @blog.verify
    end

    it "adds the post to the blog" do
      @blog.expect :add_entry, nil, [@it]
      @it.publish
    end
  end
end