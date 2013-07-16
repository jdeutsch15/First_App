class Student < ActiveRecord::Base
  rolify
  after_create :default_role
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_one :profile
belongs_to :house
has_many :messages, dependent: :destroy
 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :gender, :email, :password, :password_confirmation, :remember_me, :house_id
attr_accessible :role_ids, :as => :admin
validates :name, :password, :password_confirmation, :email, :gender, presence: true
  validates :password, :password_confirmation, length: {in: 6..15}
  validates :email, uniqueness: true
  validates :password, confirmation: true
    # attr_accessible :title, :body

def self.search(search)
	search.present? and all(:conditions =>['name LIKE ? OR email LIKE ?', "%#{search.strip}%", "%#{search.strip}%"])
end
def default_role
  self.roles << Role.where(:name => 'Student').first
end
def feed
  Message.where("student_id = ?", id)
end

end