require "test_helper"

class EnvTest < Webpacker::Test
  def test_current
    reloaded_config
    assert_equal Webpacker.env, Rails.env
  end

  def test_custom_without_config
    with_rails_env("foo") do
      reloaded_config
      assert_equal Webpacker.env, "production"
    end
  end

  def test_custom_with_config
    with_rails_env("staging") do
      reloaded_config
      assert_equal Webpacker.env, "staging"
    end
  end

  def test_default
    assert_equal Webpacker::Env::DEFAULT, "production"
  end
end
