require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "account-activation" do
    mail = UserMailer.account-activation
    assert_equal "Account-activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
