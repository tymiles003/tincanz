module CapybaraExt
  # login helper
  def sign_in(user)
    page.driver.post "/users/sign_in", :user => {
      :email => user.email, :password => user.password
    }
  end

  def sign_out
    page.driver.delete "/users/sign_out"
  end

  # Just a shorter way of writing it.
  def assert_seen(text, opts={})
    if opts[:within]
      within(selector_for(opts[:within])) do
        page.should have_content(text)
      end
    else
      page.should have_content(text)
    end
  end

  def flash_alert!(text)
    within(".alert") do
      assert_seen(text)
    end
  end

  def flash_notice!(text)
    within(".notice") do
      assert_seen(text)
    end
  end

  def selector_for(identifier)
    # ... to implement
  end

  # Just shorter to type.
  def page!
    save_and_open_page
  end
end

RSpec.configure do |config|
  config.include CapybaraExt, :type => :feature
end
