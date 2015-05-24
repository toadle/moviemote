class EpisodeRating < ActiveRecord::Base

  def heart_beat_rating
    rand(4) + rating - 2
  end

end
