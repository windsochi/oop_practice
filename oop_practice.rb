class Notebook
  attr_accessor :notebook
  def add_note(note)
    notebook.push(note)
  end
  def clean
    notebook.clear
    puts 'Чисто: ' + (notebook.inspect)
  end
end

class SharedNotebook < Notebook
  @@notebooks_count = 0
  def initialize
    @id = @@notebooks_count += 1
  end
  def add_note(note)
    note.shared = true
    notebook.push(note)
  end
  def count
    @@notebooks_count
  end
  def self.count
    @@notebooks_count
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
snb = []

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
