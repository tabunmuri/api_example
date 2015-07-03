# api_example

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
	Bにも同じ様にsecret_keyを入れなければいけないが、それぞれ違う値を入れたほうが良いた	め、もう一度実行し、値をメモって、[B]に代入

        development:
          secret_key_base: [A]

        test:
          secret_key_base: [B]

        production:
          secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>



8. サーバを実行

	`rails s`

