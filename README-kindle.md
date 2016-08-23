# Kindle化の試みについて

## 作成者
市田 俊彦(Toshihiko Ichida)

## 作成環境
- ruby 2.3
- nokogiri (ruby gem)
- kindlegen

## 作成方法

1. ruby make_kindle.rb
1. kindlegen C++11-Syntax-and-Feature.opf

の操作で C++11-Syntax-and-Feature.mobi が生成されるので、これを Kindle へ転送する。

## オリジナルからの変更内容
メインのファイルは1つなので、そのまま kindlegen に食わせても mobi ファイルの作成は可能だが、ナビゲーションができないので不便な点と css を一部変更している。

また、表紙画像も最低限？のものを用意。

詳細はKindleファイル内の 『Kindle版について』 を参照のこと

## オリジナルファイル
- C++11-Syntax-and-Feature.xhtml
- README
- LICENCE

## オリジナルからの変更ファイル
- main.xhtml ・・・ C++11-Syntax-and-Feature.xhtml を改変したもの
- README.html ・・・ README を html としたもの
- LICENSE.html ・・・ LICENSE を html としたもの

## 追加ファイル
- index.html ・・・ 目次ページ
- cover.png ・・・ 表紙画像
- nav.xhtml ・・・ Kindle ナビゲーションファイル
- C++11-Syntax-and-Feature.opf ・・・ Kindle パッケージファイル

## Ruby スクリプト
- kindle.rb ・・・ kindle パッケージ作成支援
- make_kindle.rb ・・・ kindle パッケージファイル他作成

## Ruby スクリプトのライセンス
MITライセンスとする。

The MIT License (MIT)
Copyright (c) 2016 Toshihiko Ichida

TPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
