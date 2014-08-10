class Notebook

  attr_accessor :notebook

  class << self
    attr_accessor :ncount
  end

  def initialize
    self.class.ncount ||= 0
    self.class.ncount += 1
  end

  def self.count
    self.ncount
  end

  def add_note(note)
    notebook.push(note)
  end

  def clean
    notebook.clear
    puts 'Чисто: ' + (notebook.inspect)
  end

end

class SharedNotebook < Notebook

  def add_note(note)
    note.shared = true
    notebook.push(note)
  end

end

class Note
  attr_accessor :shared, :text

  def share
    @shared = true
  end
end

#создаём массив
nb = Notebook.new
nb.notebook = []

#создаём элементы массива: 3 записи в блокнот
note = Note.new
note.shared = false
note.text = 'Test'
nb.add_note(note)

note2 = Note.new
note2.shared = false
note2.text = 'Test2'
nb.add_note(note2)

note3 = Note.new
note3.shared = false
note3.text = 'Test3'
nb.add_note(note3)

#Выводим массив Notebook
puts "\n"
puts 'Массив Notebook'
puts nb.inspect

#Создаём SharedNotebook
snb = SharedNotebook.new

#копируем в него заметки из nb
snb = nb.dup

#Выводим массив SharedNotebook
puts "\n"
puts 'Массив SharedNotebook'
puts snb.inspect
puts "\n"

#Подсчёт элементов в массиве SharedNotebook
puts 'Всего общих блокнотов: '
puts SharedNotebook.count
puts "\n"
