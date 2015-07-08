# api_example

RailsでAPIサーバを作る為の、簡単なサンプルを作ってみました。
API作らなきゃいけないけど、Railsわかんないって時とかに見ると、良いかもしれません。

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


# 生成されるAPI

`rake routes`で、下記の内容が見れます

通常の方法で、ユーザ情報を追加するURL

|Prefix|Verb|URI Pattern|Controller#Action|
|:-----------:|:-----------:|:------------:|:------------:|  
|users|GET|/users(.:format)|users#index|
|          |POST|/users(.:format)          |users#create|
|new_user|GET|/users/new(.:format)|users#new|
|edit_user|GET|/users/:id/edit(.:format)|users#edit|
|user|GET|/users/:id(.:format)|users#show|
|          |PATCH|/users/:id(.:format)|users#update|
|          |PUT|/users/:id(.:format)|users#update|
|          |DELETE|/users/:id(.:format)|users#destroy|

API用のURL

|Prefix|Verb|URI Pattern|Controller#Action|
|:-----------:|:-----------:|:------------:|:------------:|  
|api_users|GET|/api/users(.:format)|api/users#index
|          |POST|/api/users(.:format)|api/users#create
|api_user|GET|/api/users/:id(.:format)|api/users#show|
|          |PATCH|/api/users/:id(.:format)|api/users#update|
|          |PUT|/api/users/:id(.:format)|api/users#update|
|          |DELETE|/api/users/:id(.:format)|api/users#destroy|


# 参考文献

[Railsドキュメント - railsコマンド(rails)](http://railsdoc.com/rails)

→主に、ControllerやModelの作成時に使います。

[Railsドキュメント - ルーティング(routes)](http://railsdoc.com/routes)

→routingに使います。

[Railsドキュメント - 検証(validation)](http://railsdoc.com/validation)

→validationに使います。