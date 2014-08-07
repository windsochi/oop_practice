class Notebook
	attr_accessor :array
	def add_note
		@notebook = Array.new
		@notebook[0] = "bloknot1"
	end
	def clean
		@notebook.clear
		puts 'Чисто: ' + (@notebook.inspect)
	end
	class SharedNotebook
		def add_note
			@shared = true
		end
		def count
		end
	end
end

class Note
	attr_accessor :shared, :text
  def share
  	@shared = true
	end
end

#вывод
notebook = Notebook.new
notebook.add_note

note = Note.new
note.shared = false
note.text = 'Hello, world.'
