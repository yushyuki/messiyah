class Post < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
    validates :address, presence: true
    validates :content, presence: true
    validates :house_rent, presence: true
    
	def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end
  def set_image2(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image2 = file_name
    end
  end
  def set_image3(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image3 = file_name
    end
  end
  def set_image4(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image4 = file_name
    end
  end
  def set_image5(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image5 = file_name
    end
  end
end
