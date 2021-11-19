class Mutations::CreateUser < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(name:, email:)
        u = User.new(name: name, email: email)

        if (u.save)
         {
            user: u,
            errors: []  
         }          
        else
         {
            user: nil,
            errors: u.errors.full_messages    
         }   
        end
    end
end