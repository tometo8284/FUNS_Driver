# **FUNs Driver**				

## サイト概要							
ドライブコースの紹介及び、投稿サイト
また、投稿を通して交流を図ることもできます。
							
## サイトテーマ							
あなたのベストコースを。そして、新たな発見との出会いを							
							
## テーマを選んだ理由							
登山やキャンプといったアクティビティにはコミュニティサイトがあるものの、ドライブを主体としたコミュニティサイトはまだありません。							
ドライブは、そういったアクティビティへのアクセス手段ではなく、アクティビティそのものだと私は考えます。							
そして、ドライブそのものへの楽しみを共有したいという気持ちで、サイトを立ち上げようと思い至りました。

## ターゲットユーザ							
車やバイク好きの方、旅行やドライブ好きの方						
							
## 主な利用シーン							
近場から遠出まで、ふらっと車やバイクでどこか出かけたいと思い至ったときに当サイトを利用してもらいたい							
					
## 機能とサイトについて
- ユーザーが操作するユーザー機能と管理者側が操作する管理者機能があります。
- ユーザーが投稿した内容に対して、他のユーザーがコメントやいいねを通して交流する事が想定されます。
- 投稿には都道府県や地名、カテゴリや使用した乗り物など様々な項目を選択する欄があり、それを元に投稿を絞り込む機能があります。
- 投稿には具体的な場所が視覚的に分かりやすくなるように、地図が含まれます。
また、地図上には写真や文章を入れ込む事や、走行経路を描ける機能があります。

### 1.ユーザー機能
＊ユーザー = 登録済みユーザー
- ユーザーは新規登録・ログイン・ログアウト・退会ができます。
- 新規登録時、下記の情報をユーザー情報として保持します。
  - 名前（他のユーザーに公開されない名前）
  - ニックネーム（他のユーザーに公開される名前）
  - メールアドレス
  - パスワード
- ログインにはメールアドレスとパスワードで行えます。
- 退会機能は論理削除により実装しているため、退会済みユーザーのデータも保持します。
  - 退会済みのユーザーはログインないし、一度登録されたメールアドレスでの新規登録ができません。
- 投稿一覧と投稿の詳細画面へのアクセスはログイン前でも行えます。
- ユーザーはユーザーページから登録情報の閲覧・編集(ユーザー本人のみ)、投稿の閲覧ができます。
- ユーザー間でフォローすることができます。

### 2.管理者機能
- 管理者はdb/seeds.rb　内で用意されたパスワードによりログインを行えます。
- ユーザー情報の編集やユーザーを退会させることができます。
- 投稿の削除やコメントの削除が行えます。
- カテゴリ追加、編集が行えます。

### 3.投稿機能
- ユーザーはログイン済みの状態で制限なく投稿をすることができます。
- 投稿には詳細な文章のみでなく、画像と地図も含みます。
　-　地図上にはマーカーを落として画像や説明文を入れ込む事ができます。 
　-　地図上に線を引き、走ったコースを共有することができます。
- 投稿は公開と非公開を選択できます。
　- 非公開に設定された投稿は他ユーザーからアクセスできなくなります。　
- 投稿者は投稿を削除することができます。

### 4.コメント・いいね機能
- ログイン済みユーザーは自身の投稿・他のユーザーの投稿に対し、いいねとコメントを付けることができます。
- コメントには回数制限はありませんが、いいねは一つの投稿に対し一回までとなっています。
- コメントといいねは、ご自身の付けたもののみ、削除することができます。

## テスト
[管理者用アカウント : ログイン]
メールアドレス : admin3@admin.com
パスワード : admin555

[ユーザーアカウント : ログイン]
画面下部にゲストログインのリンクがございます。そちらを押下ください。


## 設計書							
https://docs.google.com/spreadsheets/d/1HuzaWtXNBXkDA0mXLQ_8G7ctffxBQ_FCO18E_lnLbEo/edit?usp=sharing							
							
## 開発環境							
- OS：Linux(CentOS)							
- 言語：HTML,CSS,JavaScript,Ruby,SQL							
- フレームワーク：Ruby on Rails							
- JSライブラリ：jQuery							
- IDE：Cloud9							
							
## 使用素材							
- GoogleMapsAPI
  - url: https://developers.google.com/maps?hl=ja

### 実装機能リストurl
- https://docs.google.com/spreadsheets/d/1dPPjgbInWCOUNw4gfn6e8G25g8DvT7Y8uSIHqVCfpJw/edit?usp=sharing