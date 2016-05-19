class VideoUpload < ActiveType::Object
  attribute :file, :string
  attribute :title, :string
  attribute :description, :text
  
  validates :file, presence: true
  validates :title, presence: true
  
  def upload!(user)
    account = Yt::Account.new access_token: user.token #This method creates a new yt client with the access token that we’ve received earlier
    account.upload_video self.file, title: self.title, description: self.description
  end
  
end