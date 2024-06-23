# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    description "A blog post"
    field :id, ID, null: false
    field :title, String
    field :rating, Integer
    field :comments, [Types::CommentType], description: "Comments on this post"
  end
end
