function kpop --description "Kill process on port"
    if count $argv > /dev/null
        set port $argv[1]
        lsof -t -i :$port | xargs kill
    else
        echo "Usage: kpop <port>"
    end
end
