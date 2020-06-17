class AllMatchingScores
  def perform
    Match.destroy_all
    all_users = User.all

    all_users.each do |user1|
      all_users.each do |user2|
        unless user1 == user2
          u = Match.new
          u.user = user1
          u.matched_user = user2
          u.status = [0,0,0,0,0,0,0,1,2,3,4].sample
          u.score = MatchingScore.new.perform(user1,user2)
          u.save
        end
      end
    end

  end
end
