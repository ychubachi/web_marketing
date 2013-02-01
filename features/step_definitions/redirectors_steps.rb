# -*- coding: utf-8 -*-
前提 /^ルートにアクセスする$/ do
  visit root_path
end

前提 /^DBにないコードでリダイレクタにアクセスする$/ do
  visit '/rd/99'
end

前提 /^DBにリダイレクションが保存されている$/ do
  medium = Medium.new
  medium.title = 'test medium'
  medium.save!
  target = Target.new
  target.title = 'test target'
  target.url = '/lp/pm'
  target.save!
  redirection = Redirection.new
  redirection.medium = medium
  redirection.target = target
  redirection.code = 1
  redirection.save!
end

前提 /^コードを指定してリダイレクタにアクセスする$/ do
  visit '/rd/1'
end

ならば /^"(.*?)" ページにリダイレクトされる$/ do |content|
  page.should have_content content
end
