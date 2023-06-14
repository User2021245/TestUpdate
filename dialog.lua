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
    zg = "��� ���������?",
    zgo = "Andrey_Holkin",
    zgr = "100"
  },
}
if not doesFileExist('moonloader/config/dialog.ini') then inicfg.save(def, inis) end
function main()
	while not isSampAvailable() do wait(0) end
	autoupdate("https://raw.githubusercontent.com/User2021245/TestUpdate/main/update%2Cjs", '['..string.upper(thisScript().name)..']: ', "https://github.com/User2021245/TestUpdate/raw/main/dialog.luac")
	mainIni = inicfg.load(nil, directIni)
	sampAddChatMessage(tags.." ������� /panel", -1)
	wait(0)
	sampRegisterChatCommand('panel', panel)
	while true do
	wait(0)
	---------------------------������� �������---------------------------
	local result, button, list, input = sampHasDialogRespond(13347)
		if result then
			if button == 1 then
				if list == 0 then
					if zapusk == false then
						sampShowDialog(13349, '��: �������', '�������: '..mainIni.config.zg..'\n�����: '..mainIni.config.zgo..'\n����: '..mainIni.config.zgr..' ���������\n\n{FF0000}���� �� ������ �������� ��������� "�������"\n������� �� {FFFFFF}�����>>�������� ���������\n\n{FF0000}���� ��� ����� ������� �� {FFFFFF}"�����"', '�����', '�����', 0) end
					if zapusk == true then
						sampShowDialog(13350, '��: �������', '�������: '..mainIni.config.zg..'\n�����: '..mainIni.config.zgo..'\n\n{FF0000}������� ��������\n������� �� {FFFFFF}����, {FF0000}����� �� ����������', '����', '�����', 0) end 
					end
				if list == 1 then
					sampShowDialog(13351, '��: �������', '�������� �������\t\t\t{f1c232}Enter\n\n�������� ����� �� �������\t\t{f1c232}Enter\n\n�������� ��� �� �������\t\t{f1c232}Enter', '�����', '�����', 2) end				
			elseif button == 0 then
				sampShowDialog(13338, tags, '��: {f1c232}\t\t\t������ ����� {FF001A}BETA\n\n��: {f1c232}\t\t\t�������', '�����', '�����', 2) 
		end
	end

	local result, button, list, input = sampHasDialogRespond(13351)
		if result then
			if button == 1 then
				if list == 0 then
					sampShowDialog(13352, '��: �������', '������� ������� ����', '�����', '�����', 1) end
				if list == 1 then
					sampShowDialog(13353, '��: �������', '������� ����� ����', '�����', '�����', 1) end
				if list == 2 then
					sampShowDialog(13354, '��: �����', '������� ���-�� ��� ����', '�����', '�����', 1) end
			elseif button == 0 then
				sampShowDialog(13347, '��: �������', '�������\t\t\t{99FF00}��� {FFFFFF}/ {FF0000}����\n�������� ���������', '�����', '�����', 2)
		end
	end

	local result, button, list, input = sampHasDialogRespond(13352)
		if result then
			if button == 1 then
				if list == 0 then
					lua_thread.create(function(input)
						mainIni.config.zg = input
						if inicfg.save(mainIni, directIni) then
							sampShowDialog(13351, '��: �������', '�������� �������\t\t\t{f1c232}Enter\n\n�������� ����� �� �������\t\t{f1c232}Enter\n\n�������� ��� �� �������\t\t{f1c232}Enter', '�����', '�����', 2) end
					end, input)
				end
			elseif button == 0 then
				sampShowDialog(13351, '��: �������', '�������� �������\t\t\t{f1c232}Enter\n\n�������� ����� �� �������\t\t{f1c232}Enter\n\n�������� ��� �� �������\t\t{f1c232}Enter', '�����', '�����', 2)
		end
	end

	local result, button, list, input = sampHasDialogRespond(13353)
		if result then
			if button == 1 then
				if list == 1 then
					lua_thread.create(function(input)
						mainIni.config.zgo = input
						if inicfg.save(mainIni, directIni) then
							sampShowDialog(13351, '��: �������', '�������� �������\t\t\t{f1c232}Enter\n\n�������� ����� �� �������\t\t{f1c232}Enter\n\n�������� ��� �� �������\t\t{f1c232}Enter', '�����', '�����', 2) end
					end, input)
				end
			elseif button == 0 then
				sampShowDialog(13351, '��: �������', '�������� �������\t\t\t{f1c232}Enter\n\n�������� ����� �� �������\t\t{f1c232}Enter\n\n�������� ��� �� �������\t\t{f1c232}Enter', '�����', '�����', 2)
		end
	end

local result, button, list, input = sampHasDialogRespond(13354)
		if result then
			if button == 1 then
				if list == 2 then
					lua_thread.create(function(input)
						mainIni.config.zgr = input
						if inicfg.save(mainIni, directIni) then
							sampShowDialog(13351, '��: �������', '�������� �������\t\t\t{f1c232}Enter\n\n�������� ����� �� �������\t\t{f1c232}Enter\n\n�������� ��� �� �������\t\t{f1c232}Enter', '�����', '�����', 2) end
					end, input)
				end
						elseif button == 0 then
				sampShowDialog(13351, '��: �������', '�������� �������\t\t\t{f1c232}Enter\n\n�������� ����� �� �������\t\t{f1c232}Enter\n\n�������� ��� �� �������\t\t{f1c232}Enter', '�����', '�����', 2)
		end
	end

	local result, button, list, input = sampHasDialogRespond(13349)
			if result then
				if button == 1 then
					if list == 0 then
						sampSendChat('/msg ���������� ��: �������. � ��� �������: '..mainIni.config.zg..' ����: '..mainIni.config.zgr..' ��� ������ ������ � /a. ������: /a �����')
						zapusk = true
					end
				elseif button == 0 then
					 sampShowDialog(13347, '��: �������', '�������\t\t\t{99FF00}��� {FFFFFF}/ {FF0000}����\n�������� ���������', '�����', '�����', 2)
		end			
	end

	local result, button, list, input = sampHasDialogRespond(13350)
		if result then
			if button == 1 then
				if list == 0 then
					sampSendChat('/msg ��: �������. ����������� ����� �� ������� ��� '..mainIni.config.zgo..' ����� ����. �������.')
					zapusk = false

			end
			elseif button == 0 then
				sampShowDialog(13338, tags, '��: {f1c232}\t\t\t������ ����� {FF001A}BETA\n\n��: {f1c232}\t\t\t�������', '�����', '�����', 2) 
		end
	end
	---------------------------------------------------------------------

	local result, button, list, input = sampHasDialogRespond(13338)
		if result  then
			if button == 1 and list == 1 then
				sampShowDialog(13347, '��: �������', '�������\t\t\t{99FF00}��� {FFFFFF}/ {FF0000}����\n�������� ���������', '�����', '�����', 2) end
			if button == 1 and list == 0 then
				sampShowDialog(13340, '������', '{FF0000}������ ��������!!!\n\n{FFFFFF}������� 4� ������� ���, ����� ����� � ����� Beta', '�����', '�����', 1) end
			if button == 0 then
				sampAddChatMessage(tags..' {ff0192}�� ������� ������, ������� /panel, ����� �� �������.', 0xff0192) end
	end

	------------------------������----------------------------------------------
	local result, button, list, input = sampHasDialogRespond(13340)
		if result then
			if button == 1 then
				if list == 0 and input == '1337' then
					sampShowDialog(13341, 'Beta', '����� �����\n\n��������!', '����', '�����', 0)
				elseif list == 0 then
					sampShowDialog(13342, 'Beta', '\t\t{FF0000}EROR\n\n\t{FFFFFF}�������� ���!', '�����', '�����', 0)
			end
			elseif button == 0 then
				sampShowDialog(13338, tags, '��: {f1c232}\t\t\t������ ����� {FF001A}BETA\n\n��: {f1c232}\t\t\t�������', '�����', '�����', 2)
		end
	end

	local result, button, list, input = sampHasDialogRespond(13341)
		if result then
			if button == 1 then
				if list == 0 then
					sampShowDialog(13338, tags, '��: {f1c232}\t\t\t������ ����� {FF001A}BETA\n\n��: {f1c232}\t\t\t�������', '�����', '�����', 2) 
			end
			elseif button == 0 then
				sampShowDialog(13338, tags, '��: {f1c232}\t\t\t������ ����� {FF001A}BETA\n\n��: {f1c232}\t\t\t�������', '�����', '�����', 2)
		end
	end

	local result, button, list, input = sampHasDialogRespond(13342)
		if result then
			if button == 1 then
				if list == 0 then
					sampShowDialog(13340, '������', '{FF0000}������ ��������!!!\n\n{FFFFFF}������� ���, ����� ����� � ����� Beta', '�����', '�����', 1) end
		end
	end

	----------------------------------------------------------------------------
	end
end

function panel()
	sampShowDialog(13338, tags, '��: {f1c232}\t\t\t������ ����� {FF001A}BETA\n\n��: {f1c232}\t\t\t�������', '�����', '�����', 2)
end

function SE.onServerMessage(color, text)
---------------------------------------------�������---------------------------------------------
 if text:find('(.*)%[(.*)%]') and zapusk == true then
    lua_thread.create(function()
    if text:find('{FFCD00}(.*)%[(.*)%]%*%: {42d45f}(.*)') then
	local nick, nid, talk = text:match('{FFCD00}(.*)%[(.*)%]%*%: {42d45f}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1]) then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} ����� {00ffff}%s[%s]{ffffff} ������ ������ ����� �� ������� {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg ����! ����� %s[%s] ��� ���������� ����� %s. ����������� �����������! ��������� ���!", nick, nid, talk))
		sampSendChat(string.format("/ans %s �������, �� ������� ������� � ������� ���� ���� >> "..mainIni.config.zgr.." ���������", nid))
		zapusk = false
		end
	end
    elseif text:find('{E0FFFF}(.*)%[(.*)%]%: {42d45f}(.*)') then
	local nick, nid, talk = text:match('{E0FFFF}(.*)%[(.*)%]%: {42d45f}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1]) then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} ����� {00ffff}%s[%s]{ffffff} ������ ������ ����� �� ������� {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg ����! ����� %s[%s] ��� ���������� ����� %s. ����������� �����������! ��������� ���!", nick, nid, talk))
		sampSendChat(string.format("/ans %s �������, �� ������� ������� � ������� ���� ���� >> "..mainIni.config.zgr.." ���������", nid))
		zapusk = false
		end
	end
    elseif text:find('{7777fc}(.*)%[(.*)%]%: {7777fc}(.*)') then
	local nick, nid, talk = text:match('{7777fc}(.*)%[(.*)%]%: {7777fc}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1]) then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} ����� {00ffff}%s[%s]{ffffff} ������ ������ ����� �� ������� {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg ����! ����� %s[%s] ��� ���������� ����� %s. ����������� �����������! ��������� ���!", nick, nid, talk))
		sampSendChat(string.format("/ans %s �������, �� ������� ������� � ������� ���� ���� >> "..mainIni.config.zgr.." ���������", nid))
		zapusk = false
		end
	end
    elseif text:find('{FFCD00}(.*)%[(.*)%]%: {42d45f}(.*)') then
	local nick, nid, talk = text:match('{FFCD00}(.*)%[(.*)%]%: {42d45f}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} ����� {00ffff}%s[%s]{ffffff} ������ ������ ����� �� ������� {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg ����! ����� %s[%s] ��� ���������� ����� %s. ����������� �����������! ��������� ���!", nick, nid, talk))
		sampSendChat(string.format("/ans %s �������, �� ������� ������� � ������� ���� ���� >> "..mainIni.config.zgr.." ���������", nid))
		zapusk = false
		end
	end
    elseif text:find('{FFCD00}(.*)%[(.*)%]%: {c36bff}(.*)') then
	local nick, nid, talk = text:match('{FFCD00}(.*)%[(.*)%]%: {c36bff}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} ����� {00ffff}%s[%s]{ffffff} ������ ������ ����� �� ������� {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg ����! ����� %s[%s] ��� ���������� ����� %s. ����������� �����������! ��������� ���!", nick, nid, talk))
		sampSendChat(string.format("/ans %s �������, �� ������� ������� � ������� ���� ���� >> "..mainIni.config.zgr.." ���������", nid))
		zapusk = false
		end
	end
    elseif text:find('{E0FFFF}(.*)%[(.*)%]%: {ffcd00}(.*)') then
	local nick, nid, talk = text:match('{E0FFFF}(.*)%[(.*)%]%: {ffcd00}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} ����� {00ffff}%s[%s]{ffffff} ������ ������ ����� �� ������� {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg ����! ����� %s[%s] ��� ���������� ����� %s. ����������� �����������! ��������� ���!", nick, nid, talk))
		sampSendChat(string.format("/ans %s �������, �� ������� ������� � ������� ���� ���� >> "..mainIni.config.zgr.." ���������", nid))
		zapusk = false
		end
	end
    elseif text:find('{FFCD00}(.*)%[(.*)%]%: {7777fc}(.*)') then
	local nick, nid, talk = text:match('{FFCD00}(.*)%[(.*)%]%: {7777fc}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} ����� {00ffff}%s[%s]{ffffff} ������ ������ ����� �� ������� {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg ����! ����� %s[%s] ��� ���������� ����� %s. ����������� �����������! ��������� ���!", nick, nid, talk))
		sampSendChat(string.format("/ans %s �������, �� ������� ������� � ������� ���� ���� >> "..mainIni.config.zgr.." ���������", nid))
		zapusk = false
		end
	end
  elseif text:find('{ffcd00}(.*)%[(.*)%]%: {FF4093}(.*)') then
	local nick, nid, talk = text:match('{ffcd00}(.*)%[(.*)%]%: {FF4093}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} ����� {00ffff}%s[%s]{ffffff} ������ ������ ����� �� ������� {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg ����! ����� %s[%s] ��� ���������� ����� %s. ����������� �����������! ��������� ���!", nick, nid, talk))
		sampSendChat(string.format("/ans %s �������, �� ������� ������� � ������� ���� ���� >> "..mainIni.config.zgr.." ���������", nid))
		zapusk = false
		end
	end
  elseif text:find('{ffcd00}(.*)%[(.*)%]%: {ffcd00}(.*)') then
	local nick, nid, talk = text:match('{ffcd00}(.*)%[(.*)%]%: {ffcd00}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} ����� {00ffff}%s[%s]{ffffff} ������ ������ ����� �� ������� {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg ����! ����� %s[%s] ��� ���������� ����� %s. ����������� �����������! ��������� ���!", nick, nid, talk))
		sampSendChat(string.format("/ans %s �������, �� ������� ������� � ������� ���� ���� >> "..mainIni.config.zgr.." ���������", nid))
		zapusk = false
		end
	end
    elseif text:find('{E0FFFF}(.*)%[(.*)%]%: {DC143C}(.*)') then
	local nick, nid, talk = text:match('{E0FFFF}(.*)%[(.*)%]%: {DC143C}(.*)')
        if talk:find(mainIni.config.zgo) then
		if nick:find(blacklist[1])  then
		
		else
      	   	wait(0)
			sampAddChatMessage(string.format(tags.."{ffffff} ����� {00ffff}%s[%s]{ffffff} ������ ������ ����� �� ������� {00ffff}(%s)", nick, nid, talk), 65535)
			sampSendChat(string.format("/trep %s "..mainIni.config.zgr, nid))
			sampSendChat(string.format("/msg ����! ����� %s[%s] ��� ���������� ����� %s. ����������� �����������! ��������� ���!", nick, nid, talk))
		sampSendChat(string.format("/ans %s �������, �� ������� ������� � ������� ���� ���� >> "..mainIni.config.zgr.." ���������", nid))
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
                sampAddChatMessage((prefix..'���������� ����������. ������� ���������� '..thisScript().version..'�� '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('��������� %d �� %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('�������� ���������� ���������.')
                      sampAddChatMessage((prefix..'���������� ���������!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'���������� ������ ��������. �������� ���������� ������..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': ���������� �� ���������.')
            end
          end
        else
          print('v'..thisScript().version..': �� ���� ��������� ����������. ��������� ��� ��������� �������������� �� '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end
