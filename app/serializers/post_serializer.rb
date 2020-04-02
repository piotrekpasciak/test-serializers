
# puts Benchmark.measure { posts.map { |post| PostSerializer.new(post).serialize }.to_json }

class PostSerializer
  def initialize(post)
    @post = post
  end

  def serialize
    {
      id:        post.id,
      title:     post.title,
      content:   post.content,
      coomments: post.comments.map { |comment| CommentSerializer.new(comment).serialize }
    }
  end

  private

  attr_reader :post
end

# ---- active_model_serializers gem

# puts Benchmark.measure { ActiveModelSerializers::SerializableResource.new(posts, adapter: :json).to_json }

# class PostSerializer < ActiveModel::Serializer
#   has_many :comments

#   attributes :id, :title, :content
# end

# ---- jsonapi-rails gem

# puts Benchmark.measure { PostSerializer.new(posts).serialized_json }

# class PostSerializer
#   include FastJsonapi::ObjectSerializer

#   attributes :id, :title, :content

#   attribute :comments do |post|
#     post.comments.map { |comment| CommentSerializer.new(comment).serializable_hash }
#   end
# end
