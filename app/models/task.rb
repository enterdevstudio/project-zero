class Task < ApplicationRecord

  belongs_to :user

  validates :label, :user, presence: true

  scope :due_on_today, -> {
    today = DateTime.now
    where('? <= due_at AND due_at <= ?', today.beginning_of_day, today.end_of_day)
  }
  scope :pending, -> {
    today = DateTime.now
    where(finished_at: nil).where('due_at < ?', today.beginning_of_day)
  }
  scope :backlogged, -> {
    where(due_at: nil, finished_at: nil)
  }

  alias_attribute :finished?, :finished_at?

  def finish_now!
    validates_not_finished
    update! finished_at: DateTime.now
  end

  def restart!
    update! finished_at: nil,
            due_at: DateTime.now
  end

private

  def validates_not_finished
    if finished?
      errors.add :base, :already_finished, message: 'Task is already finished'
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end

end
