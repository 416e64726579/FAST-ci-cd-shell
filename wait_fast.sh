finished="false"
while [ "${finished}" != "true" ] ; do

	GET=$(./get_test_run.sh $1 $2 $3)
	node=$(echo $GET| sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}'|grep "\"node_active\":" | awk -F ':' '{ print $2 }' | sed -e 's/"//g') 
	recording=$(echo $GET| sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}'|grep "\"ready_for_recording\":" | awk -F ':' '{ print $2 }' | sed -e 's/"//g') 	
	
	if [ "$node" == "false" ] && [ "$recording" == "false" ] ; then
		sleep 10
		echo ${node}
		echo ${recording}
		finished="false"
	else
		echo ${node}
		echo ${recording}
		finished="true"
  	fi
done
