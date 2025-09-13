class Book
  attr_accessor :title, :author, :isbn, :borrowed

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @borrowed = false
  end

  def borrow
    if @borrowed
      "Book is already borrowed!"
    else
      @borrowed = true
      puts "Book borrows successfully"
    end
  end

  def return_book
    if @borrowed
      @borrowed = false
      puts "Books returned successfully"
    else 
      puts "Book no borrowed"
    end
  end

  def to_s
   "#{@title} by #{@author} (ISBN: #{@isbn}) - #{@borrowed ? 'Borrowed' : 'Available'}"
  end
end


class EBook < Book
  attr_accessor :file_format, :file_size

  def initialize(title, author, isbn, file_format, file_size)
    super(title, author, isbn)
    @file_format = file_format
    @file_size = file_size
    @borrowed = false 
  end

  def borrow
    puts "Ebook downloaded successfully"
  end

  def return_book
    puts "Book returned "
  end

  def to_s
    "#{super} - Format: #{@file_format}, Size: #{@file_size}MB"
  end
end

class Library
  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
    puts "Book added successfully!!"
  end


  def find_by_title(title)
    @books.select { |book| book.title.downcase.include?(title.downcase) }     
  end

  def find_by_author(author)
    @books.select { |book| book.author.downcase.include?(author.downcase) }     
  end

  def list_books
    if @books.empty?
      puts "No books in the library"
    else
      @books.map(&:to_s).join("\n")
    end
  end

  def list_available_books
    available = @books.reject(&:borrowed)
    if available.empty?
      puts "No available books!!"
    else
      available.map(&:to_s).join("\n")
    end
  end


  def borrow_book(isbn)
    book = @books.find { |b| b.isbn == isbn}

    if book
      book.borrow
    else
      puts "book not found"
    end
  end

  def return_book(isbn)
    book = @books.find { |b| b.isbn == isbn}

    if book
      book.return_book
    else
      "Book not found"
    end
  end

end

library = Library.new

# Add some books
library.add_book(Book.new("Ruby Programming", "Matz", "123456"))
library.add_book(Book.new("Rails Guide", "DHH", "789012"))
library.add_book(EBook.new("Python Basics", "Guido", "345678", "PDF", 2.5))

puts library.list_books





















