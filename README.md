# Life Hack Note
![](https://user-images.githubusercontent.com/75869555/114269354-8df30d80-9a41-11eb-9027-955a3750028d.png)

## サイト概要
知らなくても生活に困ることはないけれど、
誰もが持っている便利な『ライフハック』を記録・共有するサイト

## URL
http://lifehacknote.work/  
【ゲストユーザー（観覧用）】を実装してありますので、そちらをご利用いただけると幸いです。

## 製作の背景
ライフハックのまとめサイトは多数あるが、 
一般の人が持つそれぞれの生活を便利にするライフハック術に絞った情
報を発信・共有するサイトが少ないと感じた為
質問するのではなくそれぞれの『ライフハック』を共有し
自ら検索し情報収集・忘れない為のメモとしても活用できるサイトを製作しました。
 
## 機能一覧
* ユーザー登録・ログイン機能(device)
* 管理者機能(rails_admin)
* 管理者権限(cancancan)
* 複数画像アップロード機能(refile)
* 検索・ソート機能(ransack)
* タグ付け機能
* いいね機能(Ajax)
* ランキング
* お問い合わせ機能(ActionMailer)


## 環境・使用技術

### フロントエンド
* Bootstrap 4.5.0
* jQuery、Ajax

### バックエンド
* Ruby 2.6.3
* Rails 5.2.4.5

### 開発環境
* OS：Linux(CentOS)
* IDE：Cloud9

### 本番環境
* AWS (EC2・RDS for MySQL・S3)
* Nginx・Puma
* MySQL2

### インフラ構成図
![](https://user-images.githubusercontent.com/75869555/115117737-08d89d00-9fdb-11eb-8891-0a47cf28e84e.png)


### その他使用技術
* Rubocop-airbnb
* bullet（N+1問題)
* チーム開発を意識したGitHubの活用(ブランチ、プルリク、マージ)

## ER図
![](https://user-images.githubusercontent.com/75869555/114273092-c56ab580-9a53-11eb-89b5-83f84b424869.png)


## テスト
* Rspec(単体/総合) (＊実装中)




