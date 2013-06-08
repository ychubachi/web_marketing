# Web Marketing

# 準備

必要なライブラリをインストールします．

```bash
  $ sudo apt-get install libxslt-dev
  $ sudo apt-get install libqtwebkit-dev
  $ sudo apt-get install libqt4-dev g++
  $ sudo apt-get install qt4-dev-tools
  $ sudo apt-get install libqt4-dev libqtwebkit-dev libicu48 xvfb imagemagick ttf-sazanami-gothic ttf-sazanami-mincho
  $ sudo apt-get build-dep libqtwebkit4
```

Bundlerを用い，ライブラリをインストールします．

```bash
$ bundle install --path vendor
```

# Guardの起動方法

```bash
$ bundle exec guard start
```

# ユーザの生成

railsのコンソールを起動します．

```bash
# rails c
```

rubyで下記のコードを実行します．

```ruby
User.create! do |u|
  u.email = 'user@example.com'
  u.password = 'please'
  u.password_confirmation = 'please'
end
```

# Yardの起動方法

```bash
# bundle exec yard server --reload
```

