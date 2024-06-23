module Types
  class CommentType < Types::BaseObject
    description "A comment on a post"
    field :id, ID, null: false
    field :body, String
    field :post, Types::PostType, null: false
  end
end
