class MatchingScore
  def perform(user1,user2)
    interests1 = JoinUserInterest.where(user:user1).collect(&:interest)
    interests2 = JoinUserInterest.where(user:user2).collect(&:interest)
    puts "================================"
    puts interests1
    puts interests2
    puts "================================"

    return rand(100..200)
  end
end
