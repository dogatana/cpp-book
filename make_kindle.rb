require 'nokogiri'
require 'kindle'

def make_index(nav, file)
  builder = Nokogiri::HTML::Builder.new(encoding: 'utf-8') do |doc|
    doc.html(lang: 'ja') do
      doc.head
      doc.body do
        doc.h1 '目次'
        doc.ul do
          nav.each do |item|
            doc.li { doc.a(href: item.file) { |a| a.text item.title } }
          end
        end
      end
    end
  end
  open(file, 'w:utf-8').write(builder.to_html)
end

def make_text(infile, outfile)
  text = open(infile, 'r:utf-8', &:read)
  # font = "font-family: Consolas, Inconsolata, monospace"
  builder = Nokogiri::HTML::Builder.new(encoding: 'utf-8') do |doc|
    doc.html(lang: 'ja') do
      doc.head
      doc.body do
        #doc.pre(style: font) { |tag| tag.text text }
        doc.pre { |tag| tag.text text }
      end
    end
  end
  open(outfile, 'w:utf-8').write(builder.to_html)
end


def get_nav(file)
  doc = Nokogiri::HTML.parse(open(file, 'r:utf-8', &:read))
  nav = []
  doc.css('h1/a').each do |node|
    if id = node['href']
      text = node.text
      nav << Kindle::NavElement.new(node.text, file + id)
    end
  end
  nav
end

# modify main page
File.open('C++11-Syntax-and-Feature.xhtml', 'r:utf-8') do |f|
  doc = f.read
  doc = doc.
    sub(%r!<script.*?</script>!m, '').
    sub(%r!^body.*?}!m, '').
    sub(%r!font-size : x-large ;!, 'font-size: large;').
    sub(%r!div#content pre.*?{!m, "\\&\n    line-height: 130%;")
    
    # sub(%r!font-family: "Inconsolata", "Consolas", monospace ;!,
    #     'font-family: Consolas, Inconsolata, monospace;')
  open('main.xhtml', 'w:utf-8').write(doc)
end

# make navigation file
nav = [
  Kindle::NavElement.new('kinlde版について', 'readme-kindle.html'),
  Kindle::NavElement.new('README', 'readme.html'),
  Kindle::NavElement.new('LICENSE', 'license.html')
]

nav += get_nav('main.xhtml')
Kindle::Nav.new('ja', nav).write('nav.xhtml')

# make index page
make_index(nav, 'index.html')

# make license and readme
make_text('LICENSE', 'license.html')
make_text('README', 'readme.html')

file_items = []
spine_ids = []
%w(
readme-kindle.html
readme.html
license.html
index.html
main.xhtml
).map.with_index do |file, i|
  id = "id#{i}"
  file_items << Kindle::BookItem.new(id, file)
  spine_ids << id
end

info = Kindle::BookInfo.new(
  'C++11の文法と機能 C++11/14コア言語',
  '江添亮',
  'ja', 'cover.png', '00000001')

Kindle::Opf.new(info, file_items, spine_ids).
write('C++11-Syntax-and-Feature.opf')
