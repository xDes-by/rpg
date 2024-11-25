@ECHO off

set git_path=D:\DOTA
set dota_path_content=C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\content\dota_addons\dota_mu
set dota_path_game=C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\dota_addons\dota_mu

ECHO %dota_path_content%
ECHO %dota_path_game%

robocopy "%git_path%\content" "%dota_path_content%" /mir /move /NFL /NDL /NJH /NJS /nc /ns /np
robocopy "%git_path%\game" "%dota_path_game%" /mir /move /NFL /NDL /NJH /NJS /nc /ns /np

mklink /j "%git_path%\content" "%dota_path_content%"
mklink /j "%git_path%\game" "%dota_path_game%"
pause