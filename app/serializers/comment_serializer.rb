# ---- Serializer Pattern

class CommentSerializer
  def initialize(comment)
    @comment = comment
  end

  def serialize
    {
      id:     comment.id,
      body:   comment.body,
      author: comment.author
    }
  end

  private

  attr_reader :comment
end

# # ---- active_model_serializers gem
# class CommentSerializer < ActiveModel::Serializer
#   attributes :id, :body, :author
# end

# ---- jsonapi-rails gem

# class CommentSerializer
#   include FastJsonapi::ObjectSerializer

#   attributes :id, :body, :author
# end

# ---- fast_json_api gem
