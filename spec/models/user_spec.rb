require 'spec_helper'
# require 'shoulda/matchers'


RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @user = User.create(email: "coder@skillcrush", password: "password")
    @valid_user_hash = {email: @user.email, password: @user.password}
  end

  after(:all) do
    if !@user.destroyed?
      @user.destroy
    end
  end

  it 'authenticates and returns a user when valid email and password passed in' do
    # post :authenticate, @valid_user_hash
    # expect(response).to render_template("show")
    User.authenticate(@valid_user_hash[:email], @valid_user_hash[:password])
    expect(@user).not_to eq(nil)
  end

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

end
