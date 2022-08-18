class Mutations::CreateUser < Mutations::BaseMutation
    argument :name, String, required: true
    argument :last_name, String, required: false
    argument :email, String, required: true
  
    field :user, Types::UserType, null: false
    field :errors, [String], null: false
  
    def resolve(name:, last_name:, email:)
      user = User.new(name: name, email: email, last_name: last_name)
          if user.save
        {
             user: user,
             errors: []
        }
      else
        {
            user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end