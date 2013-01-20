Feature: 資料請求メールを送信する
  In order to...

  Scenario: ユーザが資料請求をする
    Given a clear email queue
    When I submit my address
    Then "info@aiit.ac.jp" should receive an email
