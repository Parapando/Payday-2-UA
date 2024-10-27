if not _G.UALoc then
_G.UALoc = _G.UALoc or {}
UALocGlobal.replacement = UALocGlobal:GetPath() or ModPath
end

function UALocGlobal:extras()

end

Hooks:Add("LocalizationManagerPostInit", "UALoc_loc", function(...)
	LocalizationManager:add_localized_strings({	
		["UALoc_name"] = "Créditos da Tradução PT-BR",
		["UALoc_help"] = "Veja as pessoas que fizeram esse mod de Tradução PT-BR",
		["UALoc_button"] = "Voltar ao Menu",
		["UALoc_Welcome_title"] = "Nova atualização!",
		["UALoc_Desc_v9_2"] = '* Adicionado uma tela de mensagem de atualização. (NECESSÁRIO BEARDLIB)\n* Alguns nomes de dificuldade foram traduzidos, exceto "OVERKILL", "Death Wish", "Mayhem" e "Death Sentence".\n* Tradução do Rich Presence do Steam foi removida para evitar conflitos com outros mods que modificavam a Rich Presence do Steam.\n* Luvas das novas DLCs foram traduzidas.\n* Descrições de algumas conquistas foram traduzidas.\n* Legendas do Four Stores e do Ukrainian Prisoner que estavam faltando forem traduzidas.\n* Algumas interações foram corrigidas e traduzidas.',
		["UALoc_Welcome_button_OK"] = "Ok"
	})
end)

Hooks:Add("BeardLibCreateScriptDataMods", "UALocID", function()
	BeardLib:ReplaceScriptData(UALocGlobal.replacement .. "UALoc.UALoc", "custom_xml", "gamedata/UALoc", "credits", true)
end)