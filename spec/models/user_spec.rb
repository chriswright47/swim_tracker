require 'rails_helper'

RSpec.describe 'User' do
  subject { User.create(:email => 'test@example.com', :password => 'password') }
  describe '.authenticate' do
    it 'raises auth error if email not found' do
      expect{ User.authenticate('non-existent-email', 'password') }.
        to raise_error(User::AuthenticationError, 'Email not found.')
    end

    context 'for an existing user' do

      it 'raises auth error if password is incorrect' do
        expect{ User.authenticate(subject.email, 'bad-password')}.
          to raise_error(User::AuthenticationError, 'Password was incorrect.')
      end

      it 'returns user if authentication is successful' do
        expect(User.authenticate(subject.email, subject.password)).to eq subject
      end
    end
  end

  describe '#full_name' do
    it 'returns empty string if no names present' do
      expect(subject.full_name).to eq ''
    end

    it 'returns first name if present' do
      subject.first_name = 'Hal'
      expect(subject.full_name).to eq 'Hal'
    end

    it 'return last if present' do
      subject.last_name = 'Incandenza'
      expect(subject.full_name).to eq 'Incandenza'
    end

    it 'returns first and last if present' do
      subject.first_name = 'Hal'
      subject.last_name = 'Incandenza'
      expect(subject.full_name).to eq 'Hal Incandenza'
    end
  end

  describe '#display_name' do
    it 'returns email if no name present' do
      allow(subject).to receive(:full_name).and_return('')
      expect(subject.display_name).to eq 'test@example.com'
    end

    it 'returns full_name if present' do
      allow(subject).to receive(:full_name).and_return(:foo)
      expect(subject.display_name).to eq :foo
    end
  end

  describe '#encrypt_password' do
    let(:user) { User.new }

    it 'does nothing if no password present' do
      user.encrypt_password
      expect(user.password_salt).to be_nil
      expect(user.password_hash).to be_nil
    end

    it 'encrypts if password present' do
      user.password = 'password'
      user.encrypt_password
      expect(user.password_salt).to be_present
      expect(user.password_hash).to be_present
    end
  end
end