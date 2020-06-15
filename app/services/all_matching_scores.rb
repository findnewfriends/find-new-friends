class AllMatchingScores
  def perform
    Match.destroy_all
    all_users = User.all

    all_users.each_with_index do |user,index1|
      (all_users.length-index1-1).times do |index2|
        # puts "Match between user #{index1} and user #{index1+index2+1}"
        u = Match.new
        u.user = user
        u.matched_user = all_users[index1+index2+1]
        u.status = [0,0,0,0,0,0,0,1,2,3,4].sample
        u.score = MatchingScore.new.perform(user,all_users[index1+index2+1])
        u.save
      end
    end

  end
end
