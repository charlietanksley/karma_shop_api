require 'database_spec_helper'
require_relative '../../app/models/registrar'

RSpec.describe Registrar do
  describe '#user' do
    let(:email) { 'an@email.com' }
    let(:full_name) { 'some person' }
    let(:uid) { 3 }
    let(:user_info) { Hashie::Mash.new(email: email,
        full_name: full_name,
        uid: uid) }
    let(:registrar) { Registrar.new(user_info: user_info) }

    describe 'when the user exists' do
      before { User.create(email: email, name: full_name, uid: uid) }

      it 'does not create another user' do
        expect {
          registrar.user
        }.to change { User.count }.by(0)
      end

      it 'returns the existing user' do
        user = registrar.user
        expect(user.name).to eq(full_name)
      end
    end

    describe 'when the user does not exist' do
      it 'creates a user if it can' do
        expect {
          registrar.user
        }.to change { User.count }.by(1)
      end

      it 'returns the created user' do
        user = registrar.user
        expect(user.name).to eq(full_name)
      end

      it 'returns a null user when the user cannot be saved' do
        registrar = Registrar.new(user_info: Hashie::Mash.new(email: email))
        user = registrar.user
        expect(user.id).to eq(nil)
      end
    end
  end
end
