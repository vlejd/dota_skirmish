##

PlayerResource:SetCustomTeamAssignment seems to not respect max player number per team for small deviations. maybe will break for large ones...

When adding bots, you get Adding player SteamID 0 to PlayerID 1 FakeClient=1, preferred PlayerID = -1

There is IsFakeClient(PlayerID) function

If you call GetSelectedHeroName(-1), you get PR:GetSelectedHeroName called with bogus player id -1, ignoring

PlayerResource:GetPlayerName seems to be borkena nd returns "" in dev! in game it works somehow...

steam id of bots is 0

player id is perserved across team assignments


if a player disconnects during hero selection, their hero will not spawn (they have invalid player handle even though they are connected)
	- experiment: adress by waiting for player handle specifically!

if a player connects during reconstruction, they will not have contorl over their hero
	- experiment: hide the model after pause and after

you can make however many steam account you want. the trick is the ..

you need 3 computers to develop a mod. 1 for dev, and 2 for testing