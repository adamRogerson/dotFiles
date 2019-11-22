set __fish_git_prompt_showupstream = auto
set __fish_git_prompt_showcolorhints

set -g fish_prompt_pwd_dir_length 5

function fish_prompt


    set _name (hostname | cut -c 1-15)

    if [ $_name = "ROGERSON-LT" ]
        set_color ff0027 
        printf "" 

    else if [ $_name = "adam-latop" ]
        set_color ff5900
        printf "" 

    else
        set_color ff5900
        printf ($_name) 
        printf "" 
    end

   
#Directory path
    set_color 5c9143 

    printf (prompt_pwd ) 

    set_color ffffff 
    printf " :"
    


#Git
    printf '%s ' (__fish_git_prompt)

end




function fish_right_prompt 
#Date
        set date (date "+%I:%M")
        set jobs_count (jobs | wc -l | tr -d '[:space:]')

        set_color ffffff 
        printf " " 
        printf $date 

#Jobs
        if test $jobs_count != 0
            printf " " 
            set_color ff0026 
            printf J$jobs_count
            set_color ffffff 
end
end
