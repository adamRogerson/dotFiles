function runrun 
    while true
        eval $history[1]; commandline -f repaint
        sleep 0.5
        clear
    end
end
