function fish_prompt

    set_color ffffff 
    printf [

#Hostname  
    set _hostname (hostname)
    if [ $_hostname = "arogerson-laptop" ]
        set_color ff0000
        printf "laptop " 

    else if [ $_hostname = "adam-latop" ]
        set_color ff0000
        printf "laptop " 

    else
        set_color ff5900
        printf (hostname | cut -c 1-15) 
        printf " " 
    end
   
#Directory path
    set_color 7B68EE 
    switch (pwd)

    case "/root"
        printf "~"

    case "/home/arogerson"
        printf "~"

    case "*"
        printf (basename (pwd) )

    end
    

    set date (date "+%I:%M")
    set jobs_count (jobs | wc -l)

    set_color ffffff 
    printf " " 
    printf $date 
    if test $jobs_count != 0
        printf " " 
        set_color ff0026 
        printf J$jobs_count
        set_color ffffff 
    end
    printf "] "
end
