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
    "http://www.yoomee.com/media/" + {
      894178 => "W1siZiIsIjIwMTUvMDIvMDYvMTgvNTEvNTQvODQ0L2FteS5wbmciXSxbInAiLCJ0aHVtYiIsIjI2NHgyNjQjIl1d", #Amy
      894150 => "W1siZiIsIjIwMTUvMDEvMDgvMTMvNTAvNDEvNTYvdGVhbV9hbmR5LnBuZyJdLFsicCIsInRodW1iIiwiMjY0eDI2NCMiXV0", #Andy
      902911 => "W1siZiIsIjIwMTUvMDIvMDYvMTgvNTIvMjkvNzE3L2FudC5wbmciXSxbInAiLCJ0aHVtYiIsIjI2NHgyNjQjIl1d", #Ant
      894174 => "W1siZiIsIjIwMTUvMDEvMDgvMTQvMDMvMjIvMjc1L3RlYW1fY2FycmllLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Carrie
      894176 => "W1siZiIsIjIwMTUvMDEvMDgvMTQvMDQvMjEvNjcyL3RlYW1fY2xhaXJlLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Claire
      894168 => "W1siZiIsIjIwMTUvMDEvMDgvMTMvNTQvMzIvNDA5L3RlYW1fZWR3YXJkLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Edward
      894172 => "W1siZiIsIjIwMTUvMDEvMDgvMTQvMDEvMjMvNjA0L3RlYW1fZ3JlZy5wbmciXSxbInAiLCJ0aHVtYiIsIjMwMHgzMDAjIl1d", #Greg
      894170 => "W1siZiIsIjIwMTUvMDEvMDgvMTMvNTUvNDAvOTE0L3RlYW1fam9uLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Jon
      894177 => "W1siZiIsIjIwMTUvMDIvMDYvMTgvNTEvMjYvNjEyL21hcmsucG5nIl0sWyJwIiwidGh1bWIiLCIyNjR4MjY0IyJdXQ", #Mark
      894162 => "W1siZiIsIjIwMTUvMDEvMDgvMTMvNTEvMDYvNTkxL3RlYW1fbmljb2xhLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Nicola
      931740 => "W1siZiIsIjIwMTUvMDIvMDYvMTgvNTMvMTQvNzI1L25pa2tpLnBuZyJdLFsicCIsInRodW1iIiwiMjY0eDI2NCMiXV0", #Nikki
      894163 => "W1siZiIsIjIwMTUvMDEvMDgvMTMvNTMvMjAvODg1L3RlYW1fcmljaC5wbmciXSxbInAiLCJ0aHVtYiIsIjMwMHgzMDAjIl1d", #Rich
      1012032 => "W1siZiIsIjIwMTUvMTAvMjMvMTAvMTQvNTMvYmNiMDMyMTAtY2EwYi00MzNjLWExZGQtODNlMmUzYzZkMDIzL1JhY2tNdWx0aXBhcnQyMDE1MTAyMy03LTE5ZWFvdXAiXSxbInAiLCJ0aHVtYiIsIjI2NHgyNjQjIl1d", #Tom
      894171 => "W1siZiIsIjIwMTUvMDEvMDgvMTMvNTYvMzYvNDE3L3RlYW1fdGltLnBuZyJdLFsicCIsInRodW1iIiwiMzAweDMwMCMiXV0", #Tim
      1023816 => "W1siZiIsIjIwMTUvMTAvMjMvMTAvMjEvMTQvNjZiZGFkYmYtMDVkMS00N2QyLWFjYmYtYTAyNGY0YTJkOWRjL1JhY2tNdWx0aXBhcnQyMDE1MTAyMy03LWp1N3YxMCJdLFsicCIsInRodW1iIiwiMjY0eDI2NCMiXV0" #Nick
    }[self.id]
  end
end
