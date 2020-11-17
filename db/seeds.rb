require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'csv'




#Start of adp data
require 'csv'
adpplayers = []
csv_text = File.read(Rails.root.join('lib/tasks', 'seeds', 'adpv2.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  puts row[1]
  row_split = row[1].split("")
  row_split.delete_at(-1)
  row_split.delete_at(-1)
  row_split.delete_at(-1)
  row_split.delete_at(-1)
  row_split.delete_at(-1)
  fixed_name = row_split.join("")
  
  adpplayers.push({  rank: row[0], name: fixed_name, tier: row[2], adp:row[3], bye:row[4],notes:row[5],gfanpts: row[6],gyds_pass: row[7],gtds_pass: row[8],grec_rec: row[9],gyds_rec:row[10],gtds_rec:row[11],gatt_rush:row[12],gyds_rush:row[13],gtds_rush:row[14],yfanpts: row[15],yyds_pass: row[16],ytds_pass: row[17],yrec_rec: row[18],yyds_rec:row[19],ytds_rec:row[20],yatt_rush:row[21],yyds_rush:row[22],ytds_rush:row[23]})
   
end

#Start of debth chart
depth_urls = ["https://www.espn.com/nfl/team/depth/_/name/buf","https://www.espn.com/nfl/team/depth/_/name/dal","https://www.espn.com/nfl/team/depth/_/name/mia","https://www.espn.com/nfl/team/depth/_/name/ne","https://www.espn.com/nfl/team/depth/_/name/nyj","https://www.espn.com/nfl/team/depth/_/name/bal","https://www.espn.com/nfl/team/depth/_/name/cin","https://www.espn.com/nfl/team/depth/_/name/cle","https://www.espn.com/nfl/team/depth/_/name/pit","https://www.espn.com/nfl/team/depth/_/name/hou","https://www.espn.com/nfl/team/depth/_/name/ind","https://www.espn.com/nfl/team/depth/_/name/jax","https://www.espn.com/nfl/team/depth/_/name/ten","https://www.espn.com/nfl/team/depth/_/name/den","https://www.espn.com/nfl/team/depth/_/name/kc","https://www.espn.com/nfl/team/depth/_/name/lv","https://www.espn.com/nfl/team/depth/_/name/lac","https://www.espn.com/nfl/team/depth/_/name/nyg","https://www.espn.com/nfl/team/depth/_/name/phi","https://www.espn.com/nfl/team/depth/_/name/wsh","https://www.espn.com/nfl/team/depth/_/name/chi","https://www.espn.com/nfl/team/depth/_/name/det","https://www.espn.com/nfl/team/depth/_/name/gb","https://www.espn.com/nfl/team/depth/_/name/min","https://www.espn.com/nfl/team/depth/_/name/atl","https://www.espn.com/nfl/team/depth/_/name/car","https://www.espn.com/nfl/team/depth/_/name/no","https://www.espn.com/nfl/team/depth/_/name/tb","https://www.espn.com/nfl/team/depth/_/name/ari","https://www.espn.com/nfl/team/depth/_/name/lar","https://www.espn.com/nfl/team/depth/_/name/sf","https://www.espn.com/nfl/team/depth/_/name/sea"]
depth_urls.each do |url|
  parsed_page = Nokogiri::HTML(open(url))
  team_name =  parsed_page.css("h1.headline").text
  team_name_s = team_name.split(" ")
  team_name_s.delete_at(-1)
  team_name_s.delete_at(-1)
  teamB = team_name_s.join(" ")
  formationp = parsed_page.css("div.Table__Title").first.text
  starting_players = []
  parsed_page.css("span.fw-medium").each do |player|
    starting_players.push(player.text)

  end
  second_slot = [parsed_page.css("span")[54].text, parsed_page.css("span")[62].text, parsed_page.css("span")[70].text, parsed_page.css("span")[78].text, parsed_page.css("span")[86].text, parsed_page.css("span")[94].text, parsed_page.css("span")[102].text, parsed_page.css("span")[110].text, parsed_page.css("span")[118].text, parsed_page.css("span")[126].text, parsed_page.css("span")[134].text] 
  third_slot = [parsed_page.css("span")[56].text, parsed_page.css("span")[64].text, parsed_page.css("span")[72].text, parsed_page.css("span")[80].text, parsed_page.css("span")[88].text, parsed_page.css("span")[96].text, parsed_page.css("span")[104].text, parsed_page.css("span")[112].text, parsed_page.css("span")[120].text, parsed_page.css("span")[128].text, parsed_page.css("span")[136].text] 
  fourth_slot = [parsed_page.css("span")[58].text, parsed_page.css("span")[66].text, parsed_page.css("span")[74].text, parsed_page.css("span")[82].text, parsed_page.css("span")[90].text, parsed_page.css("span")[98].text, parsed_page.css("span")[106].text, parsed_page.css("span")[114].text, parsed_page.css("span")[122].text, parsed_page.css("span")[130].text, parsed_page.css("span")[138].text] 



  # Creating player from espn depth slot 1 
  i = 0
  starting_players.each do |player|
   
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
    i = i+1
    adpplayers.each do |adpplayer|
      if player.include? adpplayer[:name]
        puts player
       Player.create(name: player, position: pposition,depth: 1,doublep:true,team:teamB,injured:true,formation:formationp, rank:adpplayer[:rank], adp:adpplayer[:adp],tier:adpplayer[:tier],
       bye:adpplayer[:bye],
       notes:adpplayer[:notes],
       gfanpts:adpplayer[:gfanpts],
       gyds_pass:adpplayer[:gyds_pass],
       gtds_pass:adpplayer[:gtds_pass],
       grec_rec:adpplayer[:grec_rec],
       gyds_rec:adpplayer[:gyds_rec],
       gtds_rec:adpplayer[:gtds_rec],
       gatt_rush:adpplayer[:gatt_rush],
       gyds_rush:adpplayer[:gyds_rush],
       gtds_rush:adpplayer[:gtds_rush],
       yfanpts:adpplayer[:yfanpts],
       yyds_pass:adpplayer[:yyds_pass],
       ytds_pass:adpplayer[:ytds_pass],
       yrec_rec:adpplayer[:yrec_rec],
       yyds_rec:adpplayer[:yyds_rec],
       ytds_rec:adpplayer[:ytds_rec],
       yatt_rush:adpplayer[:yatt_rush],
       yyds_rush:adpplayer[:yyds_rush],
       ytds_rush:adpplayer[:ytds_rush],
) 
      end
    end
    puts player
    Player.create(name: player, position: pposition,depth: 1,doublep:true,team:teamB,injured:true,formation:formationp, rank:nil, adp:nil,tier:nil,
    bye:nil,
    notes:nil,
    gfanpts:nil,
    gyds_pass:nil,
    gtds_pass:nil,
    grec_rec:nil,
    gyds_rec:nil,
    gtds_rec:nil,
    gatt_rush:nil,
    gyds_rush:nil,
    gtds_rush:nil,
    yfanpts:nil,
    yyds_pass:nil,
    ytds_pass:nil,
    yrec_rec:nil,
    yyds_rec:nil,
    ytds_rec:nil,
    yatt_rush:nil,
    yyds_rush:nil,
    ytds_rush:nil,
) 
    
  end



  j = 0
  # Creating player from espn depth slot 2 
  second_slot.each do |player|
    
    pposition = ""
    case j
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
    else
      pposition = ""
    end
    j = j+1
    adpplayers.each do |adpplayer|
      if player.include? adpplayer[:name]
        Player.create(name: player, position: pposition,depth: 2,doublep:true,team:teamB,injured:true,formation:formationp, rank:adpplayer[:rank], adp:adpplayer[:adp],tier:adpplayer[:tier],
        bye:adpplayer[:bye],
        notes:adpplayer[:notes],
        gfanpts:adpplayer[:gfanpts],
        gyds_pass:adpplayer[:gyds_pass],
        gtds_pass:adpplayer[:gtds_pass],
        grec_rec:adpplayer[:grec_rec],
        gyds_rec:adpplayer[:gyds_rec],
        gtds_rec:adpplayer[:gtds_rec],
        gatt_rush:adpplayer[:gatt_rush],
        gyds_rush:adpplayer[:gyds_rush],
        gtds_rush:adpplayer[:gtds_rush],
        yfanpts:adpplayer[:yfanpts],
        yyds_pass:adpplayer[:yyds_pass],
        ytds_pass:adpplayer[:ytds_pass],
        yrec_rec:adpplayer[:yrec_rec],
        yyds_rec:adpplayer[:yyds_rec],
        ytds_rec:adpplayer[:ytds_rec],
        yatt_rush:adpplayer[:yatt_rush],
        yyds_rush:adpplayer[:yyds_rush],
        ytds_rush:adpplayer[:ytds_rush],
 )   
    end
    end
    Player.create(name: player, position: pposition,depth: 2,doublep:true,team:teamB,injured:true,formation:formationp, rank:nil, adp:nil,tier:nil,
    bye:nil,
    notes:nil,
    gfanpts:nil,
    gyds_pass:nil,
    gtds_pass:nil,
    grec_rec:nil,
    gyds_rec:nil,
    gtds_rec:nil,
    gatt_rush:nil,
    gyds_rush:nil,
    gtds_rush:nil,
    yfanpts:nil,
    yyds_pass:nil,
    ytds_pass:nil,
    yrec_rec:nil,
    yyds_rec:nil,
    ytds_rec:nil,
    yatt_rush:nil,
    yyds_rush:nil,
    ytds_rush:nil,
) 
  end
  # Creating player from espn depth slot 3
  k = 0
  third_slot.each do |player|
    
    pposition = ""
    case k
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
    else
      pposition = ""
    end
    k =k+1

    adpplayers.each do |adpplayer|
      if player.include? adpplayer[:name]
        Player.create(name: player, position: pposition,depth: 3,doublep:true,team:teamB,injured:true,formation:formationp, rank:adpplayer[:rank], adp:adpplayer[:adp],tier:adpplayer[:tier],
        bye:adpplayer[:bye],
        notes:adpplayer[:notes],
        gfanpts:adpplayer[:gfanpts],
        gyds_pass:adpplayer[:gyds_pass],
        gtds_pass:adpplayer[:gtds_pass],
        grec_rec:adpplayer[:grec_rec],
        gyds_rec:adpplayer[:gyds_rec],
        gtds_rec:adpplayer[:gtds_rec],
        gatt_rush:adpplayer[:gatt_rush],
        gyds_rush:adpplayer[:gyds_rush],
        gtds_rush:adpplayer[:gtds_rush],
        yfanpts:adpplayer[:yfanpts],
        yyds_pass:adpplayer[:yyds_pass],
        ytds_pass:adpplayer[:ytds_pass],
        yrec_rec:adpplayer[:yrec_rec],
        yyds_rec:adpplayer[:yyds_rec],
        ytds_rec:adpplayer[:ytds_rec],
        yatt_rush:adpplayer[:yatt_rush],
        yyds_rush:adpplayer[:yyds_rush],
        ytds_rush:adpplayer[:ytds_rush],
 ) 
      end
    end
    Player.create(name: player, position: pposition,depth: 3,doublep:true,team:teamB,injured:true,formation:formationp, rank:nil, adp:nil,tier:nil,
    bye:nil,
    notes:nil,
    gfanpts:nil,
    gyds_pass:nil,
    gtds_pass:nil,
    grec_rec:nil,
    gyds_rec:nil,
    gtds_rec:nil,
    gatt_rush:nil,
    gyds_rush:nil,
    gtds_rush:nil,
    yfanpts:nil,
    yyds_pass:nil,
    ytds_pass:nil,
    yrec_rec:nil,
    yyds_rec:nil,
    ytds_rec:nil,
    yatt_rush:nil,
    yyds_rush:nil,
    ytds_rush:nil,
) 
  end

  # Creating player from espn depth slot 4
  l = 0
  fourth_slot.each do |player|
    
    pposition = ""
    case l
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
    else
      pposition = ""
    end
    l = l+1
    adpplayers.each do |adpplayer|
      if player.include? adpplayer[:name]
        Player.create(name: player, position: pposition,depth: 4,doublep:true,team:teamB,injured:true,formation:formationp, rank:adpplayer[:rank], adp:adpplayer[:adp],tier:adpplayer[:tier],
        bye:adpplayer[:bye],
        notes:adpplayer[:notes],
        gfanpts:adpplayer[:gfanpts],
        gyds_pass:adpplayer[:gyds_pass],
        gtds_pass:adpplayer[:gtds_pass],
        grec_rec:adpplayer[:grec_rec],
        gyds_rec:adpplayer[:gyds_rec],
        gtds_rec:adpplayer[:gtds_rec],
        gatt_rush:adpplayer[:gatt_rush],
        gyds_rush:adpplayer[:gyds_rush],
        gtds_rush:adpplayer[:gtds_rush],
        yfanpts:adpplayer[:yfanpts],
        yyds_pass:adpplayer[:yyds_pass],
        ytds_pass:adpplayer[:ytds_pass],
        yrec_rec:adpplayer[:yrec_rec],
        yyds_rec:adpplayer[:yyds_rec],
        ytds_rec:adpplayer[:ytds_rec],
        yatt_rush:adpplayer[:yatt_rush],
        yyds_rush:adpplayer[:yyds_rush],
        ytds_rush:adpplayer[:ytds_rush],
 ) 
      end
    end
    Player.create(name: player, position: pposition,depth: 4,doublep:true,team:teamB,injured:true,formation:formationp, rank:nil, adp:nil,tier:nil,
    bye:nil,
    notes:nil,
    gfanpts:nil,
    gyds_pass:nil,
    gtds_pass:nil,
    grec_rec:nil,
    gyds_rec:nil,
    gtds_rec:nil,
    gatt_rush:nil,
    gyds_rush:nil,
    gtds_rush:nil,
    yfanpts:nil,
    yyds_pass:nil,
    ytds_pass:nil,
    yrec_rec:nil,
    yyds_rec:nil,
    ytds_rec:nil,
    yatt_rush:nil,
    yyds_rush:nil,
    ytds_rush:nil,
) 
  end
end