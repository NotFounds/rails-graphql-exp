# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    include GraphQL::Types::Relay::NodeBehaviors

    description "A blog post"
    field :databse_id, String, null: false, method: :id
    field :title, String
    field :rating, Integer
    field :comments, [Types::CommentType], description: "Comments on this post"
  end
end
