# api_example

RailsでAPIサーバを作る為の、簡単なお手本を作ってみました。
API作らなきゃいけないけど、Railsわかんないって時とかに見ると、良いかもしれません。
内容的には、テクニカルな事はあまりしていないので、初心者向けかと思います。

あと、あわせて、Jmeterの話をしたかったので、JmeterのファイルをJmeterディレクトリに入れておきました。

ダウンロードはJmeterの公式サイトより。

http://jmeter.apache.org/

# 使い方

1. bundle install

	`bundle`とコマンドを打って実行する
	
2. database.ymlを作成

	`cp config/database.yml.default config/database.yml`

3. databse.ymlの内容を編集
	
        default: &default
            adapter: mysql2
            encoding: utf8
            pool: 5
            username: <mysqlのユーザ名を入力>
            password: <mysqlのpasswordを入力>
            socket: /tmp/mysql.sock
        
  
4. Databaseを作成

	`rake db:create`

5. マイグレーションを実行

	`rake db:migrate`

6. secrets.ymlを作成

	`touch config/secrets.yml`


7. secret_key_baseを作成

	`vim config/secrets.yml`

8. secret_key_baseの中身を記述

	`rake secret`
	で出力されてきた値を下記の[A]に記述。
	
	同様にBにもsecret_keyを入れなければいけないが、それぞれ違う値を入れたほうが良いため、もう一度実行し、値をメモって、[B]に代入

        development:
          secret_key_base: [A]

        test:
          secret_key_base: [B]

        production:
          secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>



9. サーバを実行

	`rails s`

