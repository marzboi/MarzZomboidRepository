require "WAF_Main"

local DEParts = {
    DESlideUnfired = { "SlideAttachment_Unfired", "DE_unfired", "slide", "slide" },
    DESlideFired = { "SlideAttachment_Fired", "DE_fired", "slide", "slide" }
}

AnimationWeaponAction.Adjust("Base.Pistol3", "WeaponSprite", "DE_frame")
AnimationWeaponAction.addToModelWeaponPart("Base.Pistol3", { "DESlideUnfired", "DESlideFired" }, DEParts)

local ShotgunParts = {
    shotgunSlideUnfired = { "SlideAttachment_Unfired", "shotgun_unfired", "slide", "slide" },
    shotgunSlideFired = { "SlideAttachment_Fired", "shotgun_fired", "slide", "slide" }
}

AnimationWeaponAction.Adjust("Base.Shotgun", "WeaponSprite", "shotgun_frame")
AnimationWeaponAction.addToModelWeaponPart("Base.Shotgun", { "shotgunSlideUnfired", "shotgunSlideFired" }, ShotgunParts)
