class MatchingScore
  def perform(user1,user2)
    # puts "================================"
    # puts "Match score between #{user1.first_name} and #{user2.first_name}"
    score = 0
    interests1 = JoinUserInterest.where(user:user1).collect(&:interest)
    interests2 = JoinUserInterest.where(user:user2).collect(&:interest)
    common_interests = interests1 & interests2
    # puts "================================"
    # puts "common_interests.length = #{common_interests.length}"
    # puts "================================"
    if common_interests.length < 1
      # puts "No common interests, match score set to 9999"
      return 9999
    end
    # puts "================================"
    # puts interests1.collect(&:name)
    # puts "================================"
    # puts interests2.collect(&:name)
    # puts "================================"
    # puts common_interests.collect(&:name)
    # puts "================================"

    common_interests.each_with_index do |interest,index|
      intensity1=JoinUserInterest.where(user:user1).where(interest:interest).first.intensity
      # puts "User #{user1.first_name} has interest #{interest.name} with intensity #{intensity1}"
      intensity2=JoinUserInterest.where(user:user2).where(interest:interest).first.intensity
      # puts "User #{user2.first_name} has interest #{interest.name} with intensity #{intensity2}"
      score += (intensity1-intensity2)**2
    end
    puts score.class
    score = (((score.to_f)**0.5)/common_interests.length).round(3)
    return score
  end
end
