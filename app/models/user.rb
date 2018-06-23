class User < ApplicationRecord
  has_many :events,-> { where("lower(duration) > ?", Time.now).order(:duration) }, dependent: :delete_all
end
