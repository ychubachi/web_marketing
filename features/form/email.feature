Feature: email
  In order to...

  Scenario: ユーザが資料請求をする
    Given a clear email queue
    When I submit my address
    Then they should receive an email
