FactoryGirl.define do


  # factory :category do
  #   name "rails"
  # end

  sequence :slug do |n|
    "slug#{n}"
  end

  factory :pin do
    title "Rails Cheatsheet"
    url "http://rails-cheat.com"
    text "A great tool for beginning developers"
    slug
    category Category.find_by_name("rails")
  end

  sequence :email do |n|
    "email#{n}"
  end

  factory :user do
    email
    first_name "Skillcrush"
    last_name "Coder"
    password "secret"

    after(:create) do |user|
      create_list(:pin, 3)
    end
  end

end
