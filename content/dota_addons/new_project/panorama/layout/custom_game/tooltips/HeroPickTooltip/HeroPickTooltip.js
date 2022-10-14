function FindDotaHudElement(panel) {
    return $.GetContextPanel().GetParent().GetParent().GetParent().FindChildTraverse(panel);
}

function setupTooltip(){
    var heroname = $.GetContextPanel().GetAttributeString( "heroname", "" );
    var level = $.GetContextPanel().GetAttributeInt( "level", 0 );
    // $.GetContextPanel().style.backgroundColor = "transparent";
    FindDotaHudElement("ChcItemTooltip").style.position = "-150px 0 0";
    $("#HeroMovie").heroname = heroname;
    $("#HeroImage").heroname = heroname;
    $("#HeroName").text = $.Localize("#"+heroname);
    $("#HeroBadgeLabel").text = level
    if(level > 0){
        $("#HeroBadge").visible = true
        if(level <= 5){
            $("#HeroBadge").style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_0_png.vtex')"
        }else if(level <= 10){
            $("#HeroBadge").style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_1_png.vtex')"
        }else if(level <= 15){
            $("#HeroBadge").style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_2_png.vtex')"
        }else if(level <= 20){
            $("#HeroBadge").style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_3_png.vtex')"
        }else if(level <= 25){
            $("#HeroBadge").style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_4_png.vtex')"
        }else{
            $("#HeroBadge").style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_5_png.vtex')"
        }
    }else{
        $("#HeroBadge").visible = false
    }
    
}