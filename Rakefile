namespace :book do
  desc 'build basic book formats'
  task :build do
    puts "Converting to HTML..."
    `bundle exec asciidoctor cqrs-documents.asc`
    puts " -- HTML output at cqrs-documents.html"

    puts "Converting to EPub..."
    `bundle exec asciidoctor-epub3 cqrs-documents.asc`
    puts " -- Epub output at cqrs-documents.epub"

    puts "Converting to Mobi (kf8)..."
    `bundle exec asciidoctor-epub3 -a ebook-format=kf8 cqrs-documents.asc`
    puts " -- Mobi output at cqrs-documents.mobi"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor-pdf cqrs-documents.asc 2>/dev/null`
    puts " -- PDF output at cqrs-documents.pdf"
  end
end

task :default => "book:build"
