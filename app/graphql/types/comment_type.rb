module Types
  class CommentType < Types::BaseObject
    include GraphQL::Types::Relay::NodeBehaviors

    description "A comment on a post"
    field :database_id, String, null: false, method: :id
    field :body, String
    field :post, Types::PostType, null: false
  end
end
