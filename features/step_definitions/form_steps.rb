# -*- coding: utf-8 -*-

# form.feature

前提 /^: ランディングページを開いている$/ do
  visit lp_path
end

ならば /^: 送信ボタンが見える$/ do
  page.should have_button "送信"
end

# email.feature

When /^I submit my address$/ do
  visit lp_path
  fill_in 'customer_family_name', with: 'Test'
  fill_in 'customer_given_name', with: 'User'
  fill_in 'customer_email', with: 'test@example.com'
  fill_in 'comment', with: 'Comment'
  click_button '送信'
end
