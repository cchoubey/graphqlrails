module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_post, mutation: Mutations::CreatePost
    field :update_user, mutation: Mutations::UpdateUser
  end
end
