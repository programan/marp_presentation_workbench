---
<!-- theme: gaia -->
theme: default
title: Marp CLI入門
description: Markdownをプレゼンテーション資料にするMarpの入門
paginate: true
url: https://github.com/marp-team/marp-cli
image: https://github.com/marp-team/marp/blob/master/marp.png
size: 16:9 1280px 720px
footer: programanが書きました
---

<style>
section.toc, section.npx-execute ul li, section.docker-execute ul li{
  font-size: 22px;
}
</style>


<!-- _class: lead -->
# Marp CLI入門

Programan

2020/05/11

---

<!-- _class: invert -->
## <!-- fit -->はじめに

MacのDecksetやSlideasのように、プレゼンテーションスライドを、
Markdownでやってしまおうというアプリケーション。
Electron製で、各プラットフォームで動作する。

気になったので、使用してみたらとても良かったので、いろいろメモを残す。

---

<!-- _class: toc -->
<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**目次**

- [Marp CLI入門](#marp-cli入門)
    - [<!-- fit -->はじめに](#---fit---はじめに)
    - [インストール](#インストール)
    - [実行](#実行)
        - [npxコマンドで実行](#npxコマンドで実行)
        - [npm run コマンド名で実行](#npm-run-コマンド名で実行)
        - [Dockerで実行](#dockerで実行)
    - [文法](#文法)
        - [箇条書き](#箇条書き)
        - [番号付きリスト](#番号付きリスト)
        - [画像](#画像)
        - [リンク](#リンク)
        - [表](#表)

<!-- markdown-toc end -->


---

## インストール

- `npm i @marp-team/marp-cli`
  + グローバル環境にインストールする場合は`-g`を付ける
- または`npm init`でpackage.jsonを作り下記を追記
  + https://qiita.com/chihiro/items/5826678bc9287fb57a28
``` json
"dependencies": {
  "@marp-team/marp-cli": "^0.17.4"
}
```
  + または公式のDockerイメージを使う
    + https://hub.docker.com/r/marpteam/marp-cli

---

<!-- _class: npx-execute -->
## 実行

### npxコマンドで実行

* Markdownをhtmlに変換
  + `npx @marp-team/marp-cli slide-deck.md`
  + `npx @marp-team/marp-cli slide-deck.md -o output.html`
* MarkdownをPDFに変換
  + `npx @marp-team/marp-cli slide-deck.md --pdf`
  + `npx @marp-team/marp-cli slide-deck.md -o output.pdf`
* Markdownをpptxに変換
  + `npx @marp-team/marp-cli slide-deck.md --pptx`
  + `npx @marp-team/marp-cli slide-deck.md -o output.pptx`
* デバッグウォッチ
  + `npx @marp-team/marp-cli -w slide-deck.md`
* サーバーモード
  + `npx @marp-team/marp-cli -s ./slides`

---

### npm run コマンド名で実行

+ package.jsonのscriptsにコマンドを記述

``` json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "html": "marp index.md -o index.html",
    "dev": "marp --html --server .",
    "build": "marp --html --pdf --allow-local-files --title 'スライドのタイトル' slide.md -o ./slide.pdf"
  },
```

---

<!-- _class: docker-execute -->
### Dockerで実行

+ `docker run`でmarpのコマンドを実行する
    + `docker run --rm -v $PWD:/home/marp/app/ -e LANG=$LANG marpteam/marp-cli slide-deck.md`
    + `docker-compose run --rm app index.md --pdf --allow-local-files`
    + `docker-compose run --rm app index.md --pptx --allow-local-files`
* また、`docker run`の場合、ポートがマッピングされないので、サーバーモード起動は`--service-ports`を付ける
    + `docker-compose run --rm --service-ports app -s .`
---


## 文法


基本は普通のMarkdownだが、スライドにしたときに
Marp独自の動きをするものがいくつかある。

---

### 箇条書き

+ `+`,`-`,`*`が使える
+ この内、`*`のものはアニメーションエフェクトがある
  * 最初は隠れている

---


### 番号付きリスト

+ インデントはスペース4つ
+ 1から書く
+ アニメーションは無い

1. hoge
   1. foo
   1. bar
1. moge
   1. buz
   1. fizz

---


### 画像

  + `%`と位置指定は効かないみたい

![](uma.jpg)
![w:48px h:24px](uma.jpg)
![70% center](uma.jpg)
![bg](uma.jpg)


---

### リンク

* `[リンクする文字列](URL)`で記入
    * [Googleトップ](https://www.google.co.jp/)
* または、URLを表すラベルを定義してから記入
    * `[google_url]: https://www.google.co.jp/` でラベルを定義
    * `[Googleトップ][google_url]` ラベルを指定
    * [Googleトップ][google_url]

[google_url]: https://www.google.co.jp/


----

### 表

|商品A|商品B|商品C|
|-----|-----|-----|
|人気ない|そこそこ|大人気|
|人気ない|そこそこ|大人気|
|人気ない|そこそこ|大人気|
|人気ない|そこそこ|大人気|

