class Result < ActiveRecord::Base
  belongs_to :answer
  belongs_to :exam
  belongs_to :question

  def is_correct?
    answer.try(:is_correct?) || false
  end
end
