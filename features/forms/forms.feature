# language: ja
フィーチャ: フォーム
  フォームがきちんと動作すること

  @javascript
  シナリオ: ユーザが資料請求をする（フォーム）
    前提 資料請求フォームを開いている
    ならば Loginリンクが表示されない
      かつ 送信ボタンが見える
    前提 メールが送信されていない
    もし "産技" "太郎" "140-0011" と "test@example.com" を記入した
      かつ 問い合わせ内容に "資料請求テスト" を記入した
      かつ 送信ボタンを押した
    ならば "info@aiit.ac.jp" がメールを受け取る
    前提  担当者が "info@aiit.ac.jp" 宛のメールを開いた
    ならば メールに "test@example.com" が記入されている
      かつ メールに "品川区東大井" が記入されている
      かつ メールに "資料請求テスト" が記入されている

  @javascript
  シナリオ: ユーザが資料請求をする（ランディングページ）
    前提 ランディングページを開いている
    ならば 送信ボタンが見える
      かつ Loginリンクが表示されない
    前提 メールが送信されていない
    もし "産技" "太郎" "140-0011" と "test@example.com" を記入した
      かつ コメントに "資料請求テストLP" を記入した
      かつ 送信ボタンを押した
    ならば "info@aiit.ac.jp" がメールを受け取る
    前提  担当者が "info@aiit.ac.jp" 宛のメールを開いた
    ならば メールに "test@example.com" が記入されている
      かつ メールに "品川区東大井" が記入されている
      かつ メールに "資料請求テストLP" が記入されている
