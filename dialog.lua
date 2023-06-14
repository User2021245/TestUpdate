if not doesDirectoryExist("moonloader/config") then createDirectory("moonloader/config") end
require "lib.moonloader"

local 						SE = require 'samp.events'
local 						inicfg = require 'inicfg'
local directIni = 					"moonloader\\config\\dialog.ini"
local inis = 						"dialog.ini"
local blacklist = {"NONE"}
local zapusk = false

local tags = "{FFFFFF}[TestMain 1.0]:"
local def = {
    config = {
    zg = "Кто создатель?",
    zgo = "Andrey_Holkin",
    zgr = "100"
  },
}
if not doesFileExist('moonloader/config/dialog.ini') then inicfg.save(def, inis) end
function main()
	while not isSampAvailable() do wait(0) end
	autoupdate("https://raw.githubusercontent.com/User2021245/TestUpdate/main/update%2Cjs", '['..string.upper(thisScript().name)..']: ', "https://github.com/User2021245/TestUpdate/raw/main/dialog.luac")
	mainIni = inicfg.load(nil, directIni)
	sampAddChatMessage(tags.." Введите /panel", -1)
	wait(0)
	sampRegisterChatCommand('panel', panel)
	while true do
	wait(0)
	---------------------------Загадка Диалоги---------------------------
	local result, button, list, input = sampHasDialogRespond(13347)
		if result then
			if button == 1 then
				if list == 0 then
					if zapusk == false then
						sampShowDialog(13349, 'МП: Загадка', 'Загадка: '..mainIni.config.zg..'\nОтвет: '..mainIni.config.zgo..'\nПриз: '..mainIni.config.zgr..' репутации\n\n{FF0000}Если вы хотите изменить настройки "Загадка"\nнажмите на {FFFFFF}Назад>>Изменить настройки\n\n{FF0000}Если все верно нажмите на {FFFFFF}"Далее"', 'Далее', 'Назад', 0) end
					if zapusk == true then
						sampShowDialog(13350, 'МП: Загадка', 'Загадка: '..mainIni.config.zg..'\nОтвет: '..mainIni.config.zgo..'\n\n{FF0000}Загадка запущена\nнажмите на {FFFFFF}Стоп, {FF0000}чтобы ее остановить', 'Стоп', 'Назад', 0) end 
					end
				if list == 1 then
					sampShowDialog(13351, 'МП: Загадка', 'Изменить загадку\t\t\t{f1c232}Enter\n\nИзменить ответ на загадку\t\t{f1c232}Enter\n\nИзменить реп на загадку\t\t{f1c232}Enter', 'Далее', 'Назад', 2) end				
			elseif button == 0 then
				sampShowDialog(13338, tags, 'МП: {f1c232}\t\t\tУгадай число {FF001A}BETA\n\nМП: {f1c232}\t\t\tЗагадка', 'Далее', 'Выход', 2) 
		end
	end

	local result, button, list, input = sampHasDialogRespond(13351)
		if result then
			if button == 1 then
				if list == 0 then
					sampShowDialog(13352, 'МП: Загадка', 'Введите загадку ниже', 'Далее', 'Назад', 1) end
				if list == 1 then
					sampShowDialog(13353, 'МП: Загадка', 'Введите ответ ниже', 'Далее', 'Назад', 1) end
				if list == 2 then
					sampShowDialog(13354, 'МП: Цифра', 'Введите кол-во реп ниже', 'Далее', 'Назад', 1) end
			elseif button == 0 then
				sampShowDialog(13347, 'МП: Загадка', 'Загадка\t\t\t{99FF00}Вкл {FFFFFF}/ {FF0000}Выкл\nИзменить настройки', 'Далее', 'Назад', 2)
		end
	end

	local result, button, list, input = sampHasDialogRespond(13352)
		if result then
			if button == 1 then
				if list == 0 then
					lua_thread.create(function(input)
						mainIni.config.zg = input
						if inicfg.save(mainIni, directIni) then
							sampShowDialog(13351, 'МП: Загадка', 'Изменить загадку\t\t\t{f1c232}Enter\n\nИзменить ответ на загадку\t\t{f1c232}Enter\n\nИзменить реп на загадку\t\t{f1c232}Enter', 'Далее', 'Назад', 2) end
					end, input)
				end
			elseif button == 0 then
				sampShowDialog(13351, 'МП: Загадка', 'Изменить загадку\t\t\t{f1c232}Enter\n\nИзменить ответ на загадку\t\t{f1c232}Enter\n\nИзменить реп на загадку\t\t{f1c232}Enter', 'Далее', 'Назад', 2)
		end
	end

	local result, button, list, input = sampHasDialogRespond(13353)
		if result then
			if button == 1 then
				if list == 1 then
					lua_thread.create(function(input)
						mainIni.config.zgo = input
						if inicfg.save(mainIni, directIni) then
							sampShowDialog(13351, 'МП: Загадка', 'Изменить загадку\t\t\t{f1c232}Enter\n\nИзменить ответ на загадку\t\t{f1c232}Enter\n\nИзменить реп на загадку\t\t{f1c232}Enter', 'Далее', 'Назад', 2) end
					end, input)
				end
			elseif button == 0 then
				sampShowDialog(13351, 'МП: Загадка', 'Изменить загадку\t\t\t{f1c232}Enter\n\nИзменить ответ на загадку\t\t{f1c232}Enter\n\nИзменить реп на загадку\t\t{f1c232}Enter', 'Далее', 'Назад', 2)
		end
	end

local result, button, list, input = sampHasDialogRespond(13354)
		if result then
			if button == 1 then
				if list == 2 then
					lua_thread.create(function(input)
						mainIni.config.zgr = input
						if inicfg.save(mainIni, directIni) then
							sampShowDialog(13351, 'МП: Загадка', 'Изменить загадку\t\t\t{f1c232}Enter\n\nИзменить ответ на загадку\t\t{f1c232}Enter\n\nИзменить реп на загадку\t\t{f1c232}Enter', 'Далее', 'Назад', 2) end
					end, input)
				end
						elseif button == 0 then
				sampShowDialog(13351, 'МП: Загадка', 'Изменить загадку\t\t\t{f1c232}Enter\n\nИзменить ответ на загадку\t\t{f1c232}Enter\n\nИзменить реп на загадку\t\t{f1c232}Enter', 'Далее', 'Назад', 2)
		end
	end

	local result, button, list, input = sampHasDialogRespond(13349)
			if result then
				if button == 1 then
					if list == 0 then
						sampSendChat('/msg Стартовало МП: Загадка. И так загадка: '..mainIni.config.zg..' Приз: '..mainIni.config.zgr..' реп Ответы писать в /a. Пример: /a Ответ')
						zapusk = true
					end
				elseif button == 0 then
					 sampShowDialog(13347, 'МП: Загадка', 'Загадка\t\t\t{99FF00}Вкл {FFFFFF}/ {FF0000}Выкл\nИзменить настройки', 'Далее', 'Назад', 2)
		end			
	end

	local result, button, list, input = sampHasDialogRespond(13350)
		if result then
			if button == 1 then
				if list == 0 then
					sampSendChat('/msg МП: Загадка. Закончилось ответ на загадку был '..mainIni.config.zgo..' Ждите след. загадку.')
					zapusk = false

			end
			elseif button == 0 then
				sampShowDialog(13338, tags, 'МП: {f1c232}\t\t\tУгадай число {FF001A}BETA\n\nМП: {f1c232}\t\t\tЗагадка', 'Далее', 'Выход', 2) 
		end
	end
	---------------------------------------------------------------------

	local result, button, list, input = sampHasDialogRespond(13338)
		if result  then
			if button == 1 and list == 1 then
				sampShowDialog(13347, 'МП: Загадка', 'Загадка\t\t\t{99FF00}Вкл {FFFFFF}/ {FF0000}Выкл\nИзменить настройки', 'Далее', 'Назад', 2) end
			if button == 1 and list == 0 then
				sampShowDialog(13340, 'Доступ', '{FF0000}ДОСТУП ЗАПРЕЩЕН!!!\n\n{FFFFFF}Введите 4х значный код, чтобы войти в режим Beta', 'Далее', 'Назад', 1) end
			if button == 0 then
				sampAddChatMessage(tags..' {ff0192}Вы закрыли панель, введите /panel, чтобы ее открыть.', 0xff0192) end
	end

	------------------------Доступ----------------------------------------------
	local result, button, list, input = sampHasDialogRespond(13340)
		if result then
			if button == 1 then
				if list == 0 and input == '1337' then
					sampShowDialog(13341, 'Beta', 'Скоро будет\n\nОжидайте!', 'Меню', 'Выход', 0)
				elseif list == 0 then
					sampShowDialog(13342, 'Beta', '\t\t{FF0000}EROR\n\n\t{FFFFFF}НЕВЕРНЫЙ КОД!', 'Назад', 'Выход', 0)
			end
			elseif button == 0 then
				sampShowDialog(13338, tags, 'МП: {f1c232}\t\t\tУгадай число {FF001A}BETA\n\nМП: {f1c232}\t\t\tЗагадка', 'Далее', 'Выход', 2)
		end
	end

	local result, button, list, input = sampHasDialogRespond(13341)
		if result then
			if button == 1 then
				if list == 0 then
					sampShowDialog(13338, tags, 'МП: {f1c232}\t\t\tУгадай число {FF001A}BETA\n\nМП: {f1c232}\t\t\tЗагадка', 'Далее', 'Выход', 2) 
			end
			elseif button == 0 then
				sampShowDialog(13338, tags, 'МП: {f1c232}\t\t\tУгадай число {FF001A}BETA\n\nМП: {f1c232}\t\t\tЗагадка', 'Далее', 'Выход', 2)
		end
	end

	local result, button, list, input = sampHasDialogRespond(13342)
		if result then
			if button == 1 then
				if list == 0 then
					sampShowDialog(13340, 'Доступ', '{FF0000}ДОСТУП ЗАПРЕЩЕН!!!\n\n{FFFFFF}Введите код, чтобы войти в режим Beta', 'Далее', 'Назад', 1) end
		end
	end

	----------------------------------------------------------------------------
	end
end

function panel()
	sampShowDialog(13338, tags, 'МП: {f1c232}\t\t\tУгадай число {FF001A}BETA\n\nМП: {f1c232}\t\t\tЗагадка', 'Далее', 'Выход', 2)
end

function SE.onServerMessage(color, text)
---------------------------------------------Загадка---------------------------------------------
 if text:find('(.*)%[(.*)%]') and zapusk == true then
    lua_thread.create(function()
    if text:find('{FFCD00}(.*)%[(.*)%]%*%: {42d45f}(.*)') then
	local nick, nid, talk = text:match('{FFCD00}(.*)%[(.*)%]%*%: {42d45f}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1]) then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} Игрок {00ffff}%s[%s]{ffffff} назвал верный ответ на загадку {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg СТОП! Игрок %s[%s] дал правильный ответ %s. Мероприятие закончилось! Поздравим его!", nick, nid, talk))
		sampSendChat(string.format("/ans %s Молодец, ты отгадал загадку и получил свой приз >> "..mainIni.config.zgr.." репутации", nid))
		zapusk = false
		end
	end
    elseif text:find('{E0FFFF}(.*)%[(.*)%]%: {42d45f}(.*)') then
	local nick, nid, talk = text:match('{E0FFFF}(.*)%[(.*)%]%: {42d45f}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1]) then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} Игрок {00ffff}%s[%s]{ffffff} назвал верный ответ на загадку {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg СТОП! Игрок %s[%s] дал правильный ответ %s. Мероприятие закончилось! Поздравим его!", nick, nid, talk))
		sampSendChat(string.format("/ans %s Молодец, ты отгадал загадку и получил свой приз >> "..mainIni.config.zgr.." репутации", nid))
		zapusk = false
		end
	end
    elseif text:find('{7777fc}(.*)%[(.*)%]%: {7777fc}(.*)') then
	local nick, nid, talk = text:match('{7777fc}(.*)%[(.*)%]%: {7777fc}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1]) then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} Игрок {00ffff}%s[%s]{ffffff} назвал верный ответ на загадку {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg СТОП! Игрок %s[%s] дал правильный ответ %s. Мероприятие закончилось! Поздравим его!", nick, nid, talk))
		sampSendChat(string.format("/ans %s Молодец, ты отгадал загадку и получил свой приз >> "..mainIni.config.zgr.." репутации", nid))
		zapusk = false
		end
	end
    elseif text:find('{FFCD00}(.*)%[(.*)%]%: {42d45f}(.*)') then
	local nick, nid, talk = text:match('{FFCD00}(.*)%[(.*)%]%: {42d45f}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} Игрок {00ffff}%s[%s]{ffffff} назвал верный ответ на загадку {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg СТОП! Игрок %s[%s] дал правильный ответ %s. Мероприятие закончилось! Поздравим его!", nick, nid, talk))
		sampSendChat(string.format("/ans %s Молодец, ты отгадал загадку и получил свой приз >> "..mainIni.config.zgr.." репутации", nid))
		zapusk = false
		end
	end
    elseif text:find('{FFCD00}(.*)%[(.*)%]%: {c36bff}(.*)') then
	local nick, nid, talk = text:match('{FFCD00}(.*)%[(.*)%]%: {c36bff}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} Игрок {00ffff}%s[%s]{ffffff} назвал верный ответ на загадку {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg СТОП! Игрок %s[%s] дал правильный ответ %s. Мероприятие закончилось! Поздравим его!", nick, nid, talk))
		sampSendChat(string.format("/ans %s Молодец, ты отгадал загадку и получил свой приз >> "..mainIni.config.zgr.." репутации", nid))
		zapusk = false
		end
	end
    elseif text:find('{E0FFFF}(.*)%[(.*)%]%: {ffcd00}(.*)') then
	local nick, nid, talk = text:match('{E0FFFF}(.*)%[(.*)%]%: {ffcd00}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} Игрок {00ffff}%s[%s]{ffffff} назвал верный ответ на загадку {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg СТОП! Игрок %s[%s] дал правильный ответ %s. Мероприятие закончилось! Поздравим его!", nick, nid, talk))
		sampSendChat(string.format("/ans %s Молодец, ты отгадал загадку и получил свой приз >> "..mainIni.config.zgr.." репутации", nid))
		zapusk = false
		end
	end
    elseif text:find('{FFCD00}(.*)%[(.*)%]%: {7777fc}(.*)') then
	local nick, nid, talk = text:match('{FFCD00}(.*)%[(.*)%]%: {7777fc}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} Игрок {00ffff}%s[%s]{ffffff} назвал верный ответ на загадку {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg СТОП! Игрок %s[%s] дал правильный ответ %s. Мероприятие закончилось! Поздравим его!", nick, nid, talk))
		sampSendChat(string.format("/ans %s Молодец, ты отгадал загадку и получил свой приз >> "..mainIni.config.zgr.." репутации", nid))
		zapusk = false
		end
	end
  elseif text:find('{ffcd00}(.*)%[(.*)%]%: {FF4093}(.*)') then
	local nick, nid, talk = text:match('{ffcd00}(.*)%[(.*)%]%: {FF4093}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} Игрок {00ffff}%s[%s]{ffffff} назвал верный ответ на загадку {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg СТОП! Игрок %s[%s] дал правильный ответ %s. Мероприятие закончилось! Поздравим его!", nick, nid, talk))
		sampSendChat(string.format("/ans %s Молодец, ты отгадал загадку и получил свой приз >> "..mainIni.config.zgr.." репутации", nid))
		zapusk = false
		end
	end
  elseif text:find('{ffcd00}(.*)%[(.*)%]%: {ffcd00}(.*)') then
	local nick, nid, talk = text:match('{ffcd00}(.*)%[(.*)%]%: {ffcd00}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} Игрок {00ffff}%s[%s]{ffffff} назвал верный ответ на загадку {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg СТОП! Игрок %s[%s] дал правильный ответ %s. Мероприятие закончилось! Поздравим его!", nick, nid, talk))
		sampSendChat(string.format("/ans %s Молодец, ты отгадал загадку и получил свой приз >> "..mainIni.config.zgr.." репутации", nid))
		zapusk = false
		end
	end
    elseif text:find('{E0FFFF}(.*)%[(.*)%]%: {DC143C}(.*)') then
	local nick, nid, talk = text:match('{E0FFFF}(.*)%[(.*)%]%: {DC143C}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} Игрок {00ffff}%s[%s]{ffffff} назвал верный ответ на загадку {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg СТОП! Игрок %s[%s] дал правильный ответ %s. Мероприятие закончилось! Поздравим его!", nick, nid, talk))
		sampSendChat(string.format("/ans %s Молодец, ты отгадал загадку и получил свой приз >> "..mainIni.config.zgr.." репутации", nid))
		zapusk = false
		end
	end
	   end
	end)
 end
 end

function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться '..thisScript().version..'на '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Загрузка обновления завершена.')
                      sampAddChatMessage((prefix..'Обновление завершено!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': Обновление не требуется.')
            end
          end
        else
          print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end
