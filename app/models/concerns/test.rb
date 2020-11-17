  require 'nokogiri'
  require 'open-uri'
  require 'byebug'

  depth_urls = ["https://www.espn.com/nfl/team/depth/_/name/buf","https://www.espn.com/nfl/team/depth/_/name/mia","https://www.espn.com/nfl/team/depth/_/name/ne","https://www.espn.com/nfl/team/depth/_/name/nyj","https://www.espn.com/nfl/team/depth/_/name/bal","https://www.espn.com/nfl/team/depth/_/name/cin","https://www.espn.com/nfl/team/depth/_/name/cle","https://www.espn.com/nfl/team/depth/_/name/pit","https://www.espn.com/nfl/team/depth/_/name/hou","https://www.espn.com/nfl/team/depth/_/name/ind","https://www.espn.com/nfl/team/depth/_/name/jax","https://www.espn.com/nfl/team/depth/_/name/ten","https://www.espn.com/nfl/team/depth/_/name/den","https://www.espn.com/nfl/team/depth/_/name/kc","https://www.espn.com/nfl/team/depth/_/name/lv","https://www.espn.com/nfl/team/depth/_/name/lac","
  https://www.espn.com/nfl/team/depth/_/name/dal","https://www.espn.com/nfl/team/depth/_/name/nyg","https://www.espn.com/nfl/team/depth/_/name/phi","https://www.espn.com/nfl/team/depth/_/name/wsh","https://www.espn.com/nfl/team/depth/_/name/chi","https://www.espn.com/nfl/team/depth/_/name/det","https://www.espn.com/nfl/team/depth/_/name/gb","https://www.espn.com/nfl/team/depth/_/name/min","https://www.espn.com/nfl/team/depth/_/name/atl","https://www.espn.com/nfl/team/depth/_/name/car","https://www.espn.com/nfl/team/depth/_/name/no","https://www.espn.com/nfl/team/depth/_/name/tb","https://www.espn.com/nfl/team/depth/_/name/ari","https://www.espn.com/nfl/team/depth/_/name/lar","https://www.espn.com/nfl/team/depth/_/name/sf","https://www.espn.com/nfl/team/depth/_/name/sea"]
  depth_urls.each do |url|
    parsed_page = Nokogiri::HTML(open(url))
    team_name =  parsed_page.css("h1.headline").text
    formationp = parsed_page.css("div.Table__Title").first.text
    starting_players = []
    parsed_page.css("span.fw-medium").each do |player|
      starting_players.push(player.text)
    end
    second_slot = [parsed_page.css("span")[54].text, parsed_page.css("span")[62].text, parsed_page.css("span")[70].text, parsed_page.css("span")[78].text, parsed_page.css("span")[86].text, parsed_page.css("span")[94].text, parsed_page.css("span")[102].text, parsed_page.css("span")[110].text, parsed_page.css("span")[118].text, parsed_page.css("span")[126].text, parsed_page.css("span")[134].text] 
    third_slot = [parsed_page.css("span")[56].text, parsed_page.css("span")[64].text, parsed_page.css("span")[72].text, parsed_page.css("span")[80].text, parsed_page.css("span")[88].text, parsed_page.css("span")[96].text, parsed_page.css("span")[104].text, parsed_page.css("span")[112].text, parsed_page.css("span")[120].text, parsed_page.css("span")[128].text, parsed_page.css("span")[136].text] 
    fourth_slot = [parsed_page.css("span")[58].text, parsed_page.css("span")[66].text, parsed_page.css("span")[74].text, parsed_page.css("span")[82].text, parsed_page.css("span")[90].text, parsed_page.css("span")[98].text, parsed_page.css("span")[106].text, parsed_page.css("span")[114].text, parsed_page.css("span")[122].text, parsed_page.css("span")[130].text, parsed_page.css("span")[138].text] 
  


    #creating player slot 1 
    starting_players.each do |player|
      i = 0
      pposition = ""
      case i
      when 0
        pposition = "QB"
      when 1
        pposition = "RB"
      when 2
        pposition = "WR"
      when 3
        pposition = "WR"
      when 4
        pposition = "WR/TE"
      when 5
        pposition = "TE"
      when 6
        pposition = "LT"
      when 7
        pposition = "LG"
      when 8
        pposition = "C"
      when 9
        pposition = "RG"
      when 10
        pposition = "RT"
      end
      byebug
      Player.Create(name: player, position: pposition,depth: 1,doublep:false,team:team_name,injured:false,formation:formationp)
      i++
    
    end
  end



  #creating player slot 2 
  # second_slot.each do |player|
  #   i = 0
  #   pposition = ""
  #   case i
  #   when 0
  #     pposition = "QB"
  #   when 1
  #     pposition = "RB"
  #   when 2
  #     pposition = "WR"
  #   when 3
  #     pposition = "WR"
  #   when 4
  #     pposition = "WR/TE"
  #   when 5
  #     pposition = "TE"
  #   when 6
  #     pposition = "LT"
  #   when 7
  #     pposition = "LG"
  #   when 8
  #     pposition = "C"
  #   when 9
  #     pposition = "RG"
  #   when 10
  #     pposition = "RT"
  #   else
  #     pposition = ""
  #   end
  #   Player.Create(name: player, position: pposition,depth: 2,doublep:false,team:team_name,injured:false,formation:formationp)
  #   i++
  # end
  # #creating player slot 3 
  # third_slot.each do |player|
  #   i = 0
  #   pposition = ""
  #   case i
  #   when 0
  #     pposition = "QB"
  #   when 1
  #     pposition = "RB"
  #   when 2
  #     pposition = "WR"
  #   when 3
  #     pposition = "WR"
  #   when 4
  #     pposition = "WR/TE"
  #   when 5
  #     pposition = "TE"
  #   when 6
  #     pposition = "LT"
  #   when 7
  #     pposition = "LG"
  #   when 8
  #     pposition = "C"
  #   when 9
  #     pposition = "RG"
  #   when 10
  #     pposition = "RT"
  #   else
  #     pposition = ""
  #   end
  #   Player.Create(name: player, position: pposition,depth: 3,doublep:false,team:team_name,injured:false,formation:formationp)
  #   i++
  # end

  # #creating player slot 4 
  # fourth_slot.each do |player|
  #   i = 0
  #   pposition = ""
  #   case i
  #   when 0
  #     pposition = "QB"
  #   when 1
  #     pposition = "RB"
  #   when 2
  #     pposition = "WR"
  #   when 3
  #     pposition = "WR"
  #   when 4
  #     pposition = "WR/TE"
  #   when 5
  #     pposition = "TE"
  #   when 6
  #     pposition = "LT"
  #   when 7
  #     pposition = "LG"
  #   when 8
  #     pposition = "C"
  #   when 9
  #     pposition = "RG"
  #   when 10
  #     pposition = "RT"
  #   else
  #     pposition = ""
  #   end
  #   Player.Create(name: player, position: pposition,depth: 4,doublep:false,team:team_name,injured:false,formation:formationp)
  #   i++
  # end