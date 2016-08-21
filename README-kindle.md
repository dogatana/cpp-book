# Kindle化の試みについて

## 作成環境
- ruby 2.3
- nokogiri (ruby gem)
- kindlegen

## 作成方法

1. ruby make_kindle.rb
1. kindlegen C++11-Syntax-and-Feature.opf

の操作で C++11-Syntax-and-Feature.mobi が生成されるので、これを Kindle へ転送する。

## 補足
メインのファイルは1つなので、そのまま kindlegen に食わせても mobi ファイルの作成は可能だが、ナビゲーションができないので不便な点と css を一部変更している。

また、表紙画像も最低限？のものを用意。


## その他
kindlegen で解決できないハイパーリンクがあり、原稿のすべてが含まれていない模様。

## TODO

#### Kindle Paperwhite 向け修正
- Kindle Papwerwhite （2012） では、文字サイズを変更する際、非常に待たされるため、ファイル分割する必要があると思われる。
- monospace フォントの埋め込み（候補： Inconsolata）。 ようやくPaperwhite のファームウェアをアップデートしたのだが、なんとなく monospace で表示できるようにも見えるため、もしそうだとすると不要かもしれない。
