function lookup 
    if count $argv > /dev/null
        set selected (man -k $argv | dmenu -l 20 | awk '{print $1}')
        man $selected
    else
        set selected (man -k . | dmenu -l 20 | awk '{print $1}')
        man $selected
    end
end
