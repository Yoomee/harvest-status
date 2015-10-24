Harvest::User.class_eval do
  def timeline_items
    TimelineItem.where(:user_id => self.id)
  end

  def timers
    Timer.where(:user_id => self.id)
  end

  def avatar_url(size = 80)
    stripped_email = email.strip
    downcase_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcase_email)

    "http://gravatar.com/avatar/#{hash}?s=#{size}"
  end

  def image
    "http://www.yoomee.com/media/W1siZiIsIjIwMTUvMD" + {
      894178 => "IvMDYvMTgvNTEvNTQvODQ0L2FteS5wbmciXSxbInAiLCJ0aHVtYiIsIjI2NHgyNjQjIl1d", #Amy
      894150 => "EvMDgvMTMvNTAvNDEvNTYvdGVhbV9hbmR5LnBuZyJdLFsicCIsInRodW1iIiwiMjY0eDI2NCMiXV0", #Andy
      902911 => "IvMDYvMTgvNTIvMjkvNzE3L2FudC5wbmciXSxbInAiLCJ0aHVtYiIsIjI2NHgyNjQjIl1d", #Ant
      894174 => "EvMDgvMTQvMDMvMjIvMjc1L3RlYW1fY2FycmllLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Carrie
      894176 => "EvMDgvMTQvMDQvMjEvNjcyL3RlYW1fY2xhaXJlLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Claire
      894173 => "EvMDgvMTQvMDIvMjUvMjkzL3RlYW1fZGF2aWQucG5nIl0sWyJwIiwidGh1bWIiLCIzMDB4MzAwIyJdXQ", #David
      894168 => "EvMDgvMTMvNTQvMzIvNDA5L3RlYW1fZWR3YXJkLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Edward
      894172 => "EvMDgvMTQvMDEvMjMvNjA0L3RlYW1fZ3JlZy5wbmciXSxbInAiLCJ0aHVtYiIsIjMwMHgzMDAjIl1d", #Greg
      894170 => "EvMDgvMTMvNTUvNDAvOTE0L3RlYW1fam9uLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Jon
      894177 => "IvMDYvMTgvNTEvMjYvNjEyL21hcmsucG5nIl0sWyJwIiwidGh1bWIiLCIyNjR4MjY0IyJdXQ", #Mark
      894162 => "EvMDgvMTMvNTEvMDYvNTkxL3RlYW1fbmljb2xhLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Nicola
      931740 => "IvMDYvMTgvNTMvMTQvNzI1L25pa2tpLnBuZyJdLFsicCIsInRodW1iIiwiMjY0eDI2NCMiXV0",
      894163 => "EvMDgvMTMvNTMvMjAvODg1L3RlYW1fcmljaC5wbmciXSxbInAiLCJ0aHVtYiIsIjMwMHgzMDAjIl1d", #Rich
      899087 => "EvMDgvMTMvNTcvMzQvOTMwL3RlYW1fdG9tLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Tom
      894171 => "EvMDgvMTMvNTYvMzYvNDE3L3RlYW1fdGltLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0" #Tim
    }[self.id]
  end
end
