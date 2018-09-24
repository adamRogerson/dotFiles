function fish_prompt

    set base (basename (pwd))
    set date (date "+%I:%M")
    echo [(set_color yellow)$base (set_color white)$date]'> '
    
end
