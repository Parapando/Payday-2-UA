Hooks:PostHook(LevelLoadingScreenGuiScript,"init","UALocalizationLevelLoading",function(self)
    local title_text = "В ПРОЦЕСІ"
	if self._level_title_text then
		self._level_title_text:set_text(title_text)
		local _, _, w, h = self._level_title_text:text_rect()
		self._level_title_text:set_size(w, h)
		self._level_title_text:set_right(self._indicator:left())
		self._level_title_text:set_center_y(self._indicator:center_y() + 2)
	end
end)