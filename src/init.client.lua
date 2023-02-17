local _ScriptHubName = 'Fluid Hub'

local GamesSupport = {
    ['Tower Of Hell'] = {1962086868, 3582763398},
}

for i,v in next, GamesSupport do
  if v and type(v) == 'table' then
    for x = 1, #v do
      if v[x] == game.PlaceId then
        require(script.Others[i].Script)()
      end
    end
  elseif v and type(v) == 'number' then
    if game.PlaceId == v then
      require(script.Others[v].Script)()
    end
  end
end