function kk --description "Kill (k)urrent background process"
  set pid (jobs -l | awk '{print $2}')
  if test -z $pid
    echo "no background process"
    return 1
  end
  kill -9 $pid
end
