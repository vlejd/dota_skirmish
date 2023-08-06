## Random facts I learned about the Dota modding

- PlayerResource:SetCustomTeamAssignment seems to not respect max player number per team for small deviations. maybe will break for large ones...
- when adding bots, you get Adding player SteamID 0 to PlayerID 1 FakeClient=1, preferred PlayerID = -1
- there is IsFakeClient(PlayerID) function
- if you call GetSelectedHeroName(-1), you get PR:GetSelectedHeroName called with bogus player id -1
- PlayerResource:GetPlayerName seems to be broken and returns "" in dev! in game it works somehow...
- steam id of bots is 0
- player id is perserved across team re-assignments
- if a player disconnects during hero selection, their hero will not spawn (they have invalid player handle even though they are connected)
	- experiment: adress by waiting for player handle specifically!
- if a player connects during reconstruction, they will not have contorl over their hero
	- experiment: hide the model after pause and after
- you can make however many steam account you want. you just need to have gmail account and use random "." in the midle of your adress
- you need 3 computers to develop a mod. 1 for dev, and 2 for testing
- you can easyly run dota in an ubuntu virtual machine.
- mod development is only possible on windows.
