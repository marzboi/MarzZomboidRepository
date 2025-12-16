require "WAF_Main"

local DEParts = {
    { "SlideAttachment",   "DE_slide", "slide",   "slide" },
    { "SlideAttachment00", "DE_slide", "slide00", "slide00" },
    { "SlideAttachment10", "DE_slide", "slide10", "slide10" },
    { "SlideAttachment20", "DE_slide", "slide20", "slide20" },
    { "SlideAttachment30", "DE_slide", "slide30", "slide30" },
    { "SlideAttachment40", "DE_slide", "slide40", "slide40" },
    { "SlideAttachment50", "DE_slide", "slide50", "slide50" },
}

AnimationWeaponAction.Adjust("Base.Pistol3", "WeaponSprite", "DE_frame")
AnimationWeaponAction.addToModelWeaponPart("Base.Pistol3", DEParts)
AnimationWeaponAction.addAttachmentPoint("Base.DE_frame", -0.033)
