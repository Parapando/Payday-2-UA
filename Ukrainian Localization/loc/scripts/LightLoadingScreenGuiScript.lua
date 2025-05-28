Hooks:PostHook(LightLoadingScreenGuiScript,"init","UALocalizationLightLoading",function(self)
    local title_text = "ЗАЧЕКАЙТЕ"
	self._title_text:set_text(title_text)
end)

Hooks:PostHook(LightLoadingScreenGuiScript,"setup","UALocalizationLightLoadingSetup",function(self)
	local title_text = "ЗАЧЕКАЙТЕ"
	self._title_text:set_text(title_text)
    self._title_text:set_font_size(32)
	self._title_text:set_position(0, self._gui_tweak_data.border_pad)

	local _, _, w, h = self._title_text:text_rect()

	self._title_text:set_size(math.round(w), math.round(h))
	self._indicator:set_center_y(self._title_text:center_y() - 2)
	self._indicator:set_y(math.round(self._indicator:y()))
	self._indicator:set_left(math.round(self._title_text:right() + 8))
end)
