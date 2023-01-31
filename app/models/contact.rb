class Contact < ApplicationRecord
  belongs_to :user
  # has_many :phones
  # has_one :address

  validates :full_name, presence: true
  validates :document_number, uniqueness: { scope: :user_id }
  validates :email, presence: true, uniqueness: { scope: :user_id }, format: { with: /\A([^\s]?[\w\-+.\/"\%\!]+)@([A-Za-z\d\-\[\]\.\:\(\)]+)\z/i }

  validate :birthday_date, on: %i[create update], if: :birthday

  private

  def birthday_date
    return unless (birthday > Time.now - 18.years) && (birthday > Time.now - 100.years)

    errors.add(:birthday, ' has to be a date greater than 18 years and less than 100 years.')
  end
end
