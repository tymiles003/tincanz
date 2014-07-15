require "rails_helper"

describe 'authentication', type: :feature do
  context 'anonymous user' do
    it 'is redirected to main_app.sign in path by default' do
      visit tincanz.admin_users_path
      page.current_path.should eq('/users/sign_in')
    end

    it 'is redirected to Tincanz.sign_in_path if given' do
      Tincanz.sign_in_path = '/'
      visit tincanz.admin_users_path
      page.current_path.should eq('/')
    end
  end

end