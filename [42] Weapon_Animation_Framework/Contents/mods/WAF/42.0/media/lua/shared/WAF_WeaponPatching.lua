require "WAF_Main"

local DEParts = {
    DESlideUnfired = { "SlideAttachment_Unfired", "DE_unfired", "slide", "slide" },
    DESlideFired = { "SlideAttachment_Fired", "DE_fired", "slide", "slide" }
}

AnimationWeaponAction.Adjust("Base.Pistol3", "WeaponSprite", "DE_frame")
AnimationWeaponAction.addToModelWeaponPart("Base.Pistol3", { "DESlideUnfired", "DESlideFired" }, DEParts)
