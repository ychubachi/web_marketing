# language: ja
フィーチャ: フォーム
  フォームがきちんと動作すること

  シナリオ: フォームの内容を確認する
    前提 資料請求フォームを開いている
    ならば Loginリンクが表示されない
      かつ 送信ボタンが見える
      かつ 郵便番号変換スクリプトが埋め込まれている
      かつ 入力値検証スクリプトが埋め込まれている

  シナリオ: ユーザが資料請求をする
    前提 資料請求フォームを開いている
    かつ メールが送信されていない
    もし "産技" "太郎" "140-0011" と "test@example.com" を記入した
    ならば "info@aiit.ac.jp" がメールを受け取る
    前提  担当者が "info@aiit.ac.jp" 宛のメールを開いた
    ならば メールに "test@example.com" が記入されている

  シナリオ: ランディングページを確認する
    前提 ランディングページを開いている
    ならば Loginリンクが表示されない
      かつ 送信ボタンが見える
      かつ 郵便番号変換スクリプトが埋め込まれている
      かつ 入力値検証スクリプトが埋め込まれている

  @javascript
  シナリオ: ユーザが資料請求をする
    前提 ランディングページを開いている
      かつ メールが送信されていない
    もし "産技" "太郎" "140-0011" と "test@example.com" を記入した
    ならば "info@aiit.ac.jp" がメールを受け取る
    前提  担当者が "info@aiit.ac.jp" 宛のメールを開いた
    ならば メールに "test@example.com" が記入されている

    
