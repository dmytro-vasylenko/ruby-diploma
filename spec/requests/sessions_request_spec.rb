require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  include Devise::Test::IntegrationHelpers

  it 'should sign in user with correct credentials' do
    post '/sessions', :params => { :email => 'dmytro.vasylenko.ua@gmail.com', :password => 'qwe123' }

    json = JSON.parse(response.body)

    expect(json).to equal({ :name => 'admin', :email => 'dmytro.vasylenko.ua@gmail.com' })
  end

  it 'should not sign in user with bad email' do
    post '/sessions', :params => { :email => 'dmytro.vasylenko.uagmail.com.wrong', :password => 'qwe123' }

    json = JSON.parse(response.body)

    expect(json).to equal(nil)
  end

  it 'should not sign in user with bad password' do
    post '/sessions', :params => { :email => 'dmytro.vasylenko.ua@gmail.com', :password => 'wrong password' }

    json = JSON.parse(response.body)

    expect(json).to equal(nil)
  end
end
