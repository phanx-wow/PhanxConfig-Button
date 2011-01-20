--[[--------------------------------------------------------------------
	PhanxConfig-Button
	Simple button widget generator.
	Requires LibStub.

	This library is not intended for use by other authors. Absolutely no
	support of any kind will be provided for other authors using it, and
	its internals may change at any time without notice.
----------------------------------------------------------------------]]

local MINOR_VERSION = tonumber( string.match( "$Revision: 28 $", "%d+" ) )

local lib, oldminor = LibStub:NewLibrary( "PhanxConfig-Button", MINOR_VERSION )
if not lib then return end

local function OnEnter( self )
	local text = self.desc
	if text then
		GameTooltip:SetOwner( self, "ANCHOR_RIGHT" )
		GameTooltip:SetText( text, nil, nil, nil, nil, true )
	end
end

local function OnLeave()
	GameTooltip:Hide()
end

function lib.CreateButton( parent, name, desc )
	local button = CreateFrame( "Button", nil, parent )
	button:SetWidth( 44 )
	button:SetHeight( 19 )

	button:SetNormalFontObject( GameFontNormalSmall )
	button:SetDisabledFontObject( GameFontDisable )
	button:SetHighlightFontObject( GameFontHighlightSmall )

	button:SetNormalTexture( [[Interface\Buttons\UI-Panel-Button-Up]] )
	button:GetNormalTexture():SetTexCoord( 0, 0.625, 0, 0.6875 )

	button:SetPushedTexture( [[Interface\Buttons\UI-Panel-Button-Down]] )
	button:GetPushedTexture():SetTexCoord( 0, 0.625, 0, 0.6875 )

	button:SetHighlightTexture( [[Interface\Buttons\UI-Panel-Button-Highlight]] )
	button:GetHighlightTexture():SetTexCoord( 0, 0.625, 0, 0.6875 )
	button:GetHighlightTexture():SetBlendMode( "ADD" )

	button:SetDisabledTexture( [[Interface\Buttons\UI-Panel-Button-Disabled]] )
	button:GetDisabledTexture():SetTexCoord( 0, 0.625, 0, 0.6875 )

	button:SetScript( "OnEnter", OnEnter )
	button:SetScript( "OnLeave", OnLeave )

	button.desc = desc

	return button
end