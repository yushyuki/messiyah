class Post < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }

	def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end
end
