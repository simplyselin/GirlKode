def tally (allnumbers)
   tally=0
  allnumbers.each do |questions|
      if questions == "yes"
      tally +=1
      else
     tally -=1
      end
    end
   return tally
 end
 # yes = 1
 # no = 0
 # yesinput = yes+yes
 # noinput=no+no
 # input= yesinput+noinput
 def quiz(tally)
   if tally > 0
     "Based off of your answers, you should decide yes."
   elsif tally < 0
     "Based off of your answers, you should decide no."
   elsif tally == 0
     "You seem to feel pretty equal about your sides, so you should talk to someone and have them help you with your decision."
   end
  end
