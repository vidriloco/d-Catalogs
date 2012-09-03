Fabricator(:user, aliases: [:superuser]) do
  username 'pepe'
  email 'pepe@example.com'
  password 'prueba'
  password_confirmation 'prueba'
  transient :as
  permissions do |attrs| 
    case attrs[:as]
    when "admin"
      User.category_for(:permissions, :superuser)
    when "manager"
      User.category_for(:permissions, :superuser)
    when "observer"
      User.category_for(:permissions, :observer)
    end
  end
end