# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String
    field :name, String
    field :last_name, String, null: false
    field :posts, [Types::PostType], null:true
    field :post_count, Integer, null: true
    
    def post_count
      object.posts.size
    end
  end
end
