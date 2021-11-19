class Mutations::UpdateUser < Mutations::BaseMutation
    argument :id, Integer, required: true
    argument :name, String, required: false
    argument :email, String, required: false

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(id:, name:, email:)
        u = User.find(id)

        if !name.nil? && !name.blank?
            u.name = name
        end
        
        if !email.nil? && !email.blank?
            u.email = email
        end

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