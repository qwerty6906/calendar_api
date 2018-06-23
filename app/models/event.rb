class Event < ApplicationRecord
  belongs_to :user
  
  delegate :begin, :end, to: :duration
  attr_writer :begin, :end

  validates :user, :title, presence: true
  validate :validate_duration

  before_validation :set_duration

  def as_json(options={})
    super({only: [:title], methods: [:begin, :end]}.merge(options))
  end

  private

  def validate_duration
    errors.add(:duration, "event should start before stop") if @begin && @end && @begin >= @end
    errors.add(:begin, "can't be blank") unless @begin
    errors.add(:end, "can't be blank") unless @end
  end

  def set_duration    
    write_attribute(:duration, @begin..@end) if @begin && @end
  end
end
