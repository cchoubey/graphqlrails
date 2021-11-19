class Mutations::CreatePost < Mutations::BaseMutation
    argument :user_id, Integer, required: true
    argument :title, String, required: true
    argument :body, String, required: true

    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(user_id:, title:, body:)
        p = Post.new(user_id: user_id, title: title, body: body)

        if (p.save)
         {
            post: p,
            errors: []  
         }          
        else
         {
            post: nil,
            errors: p.errors.full_messages    
         }   
        end
    end
end