require 'yaml/store'

class Book

	attr_accessor :title, :pages
end
	book = Book.new
	book.title = "Head First Ruby"
        book.pages = 450

	store = YAML::Store.new('vitabu.yml')

	store.transaction do
	store["HFRB"] = book

	p store["HFRB"]
end
