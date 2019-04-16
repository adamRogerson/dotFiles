function adam
    set _hostname (hostname)
    if [ $_hostname = "arogerson-laptop" ]
        echo "yes"
    else 
        echo "no"
        echo $_hostname
    end
end

