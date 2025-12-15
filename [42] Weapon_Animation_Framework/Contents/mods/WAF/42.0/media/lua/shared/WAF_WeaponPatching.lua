require "WAF_Main"

local DEParts = {
    { "SlideAttachment_Unfired", "DE_unfired", "slide", "slide" },
    { "SlideAttachment_Fired",   "DE_fired",   "slide", "slide" }
}
AnimationWeaponAction.Adjust("Base.Pistol3", "WeaponSprite", "DE_frame")
AnimationWeaponAction.addToModelWeaponPart("Base.Pistol3", DEParts)

local ShotgunParts = {
    { "SlideAttachment_Unfired", "shotgun_unfired", "slide", "slide" },
    { "SlideAttachment_Fired",   "shotgun_fired",   "slide", "slide" }
}
AnimationWeaponAction.Adjust("Base.Shotgun", "WeaponSprite", "shotgun_frame")
AnimationWeaponAction.addToModelWeaponPart("Base.Shotgun", ShotgunParts)

local m788Parts = {
    { "SlideAttachment_Unfired", "m788_unfired", "slide", "slide" },
    { "SlideAttachment_Fired",   "m788_fired",   "slide", "slide" }
}
AnimationWeaponAction.Adjust("Base.HuntingRifle", "WeaponSprite", "m788_frame")
AnimationWeaponAction.addToModelWeaponPart("Base.HuntingRifle", m788Parts)
