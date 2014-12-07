class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    customer = Customer.where(:provider => auth.provider, :uid => auth.uid).first
    unless customer
      customer = Customer.create(name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    customer
  end
 
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    customer = Customer.where(:provider => auth.provider, :uid => auth.uid).first
    unless customer
      customer = Customer.create(name:     auth.info.nickname,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    Customer.create_unique_email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    customer
  end
 
  # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  def self.create_unique_string
    SecureRandom.uuid
  end
 
  # twitterではemailを取得できないので、適当に一意のemailを生成
  def self.create_unique_email
    Customer.create_unique_string + "@example.com"
  end

end
