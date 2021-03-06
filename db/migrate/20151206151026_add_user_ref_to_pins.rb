class AddUserRefToPins < ActiveRecord::Migration
  def change
    add_reference :pins, :user, index: true
    add_foreign_key :pins, :users

    user = User.create(
      first_name: "Sally",
      last_name: "Skillcrusher",
      email: "sallyskillcrusher@example.com",
      password: "s411yg1r1"
    )
    if user.present?
      Pin.all.each do |pin|
        pin.user = user
        pin.save
      end
    else
      puts "Under not present"
    end
  end
end
