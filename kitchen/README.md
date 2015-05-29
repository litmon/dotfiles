# itamaeを使ってnginx + PHPな環境を作る

itamaeを使ってnginxとPHPをインストールしてみます。

## 環境

以下の環境で行っています。

* ruby 2.1.1
* itamae 1.2.19
* serverspec 2.17.0

## 要件

* nginx
  * document root: /var/www/
* php 5.5
* ruby ~> 2.0

## Usage

### before

なにはともあれgemのinstall

```
$ bundle install
```

### itamae

```
$ bundle exec itamae --host 192.168.56.101 --user root recipe.rb
```

ね、簡単でしょう？
分かりやすいようにオプションはあえて短くしてません。

(デバッグ用) オプションたくさんバージョン+dry-runで環境を汚さない仕様

```
$ itamae ssh --host 192.168.56.101 --user root --dry-run --port 22 -l debug --color recipe.rb
```

### serverspec

~/.ssh/configに設定書いておくと、自動的に読んでくれるみたい。
なので、以下のように書いてます。

(例) ~/.ssh/config

```
Host 192.168.56.101
  HostName 192.168.56.101
  Port 22
  User root
  IdentityFile ~/.ssh/id_rsa.pub
```

serverspecを起動するときはrakeから。

```
$ bundle exec rake
```

