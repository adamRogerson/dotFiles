function _tail 
    alias _tail "tail -F /var/log/raemis.log | stdbuf -oL cut -b 28- | grep --color -E \"14440000000000.|ERROR.*|\\\$\""
end
