finished="false"
while [ "${finished}" != "true" ] ; do
	state=$(./get_test_run.sh $1 $2| sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}'|grep "\"state\":" | awk -F ':' '{ print $2 }' | sed -e 's/"//g') 
	if [ "$state" == "running" ] || [ "$state" == "running_scheduled" ] || [ "$state" == "paused" ] ; then 
		echo ${state}
		sleep 10
		finished="false"
	else
		echo "FAST tests have $state"
		finished="true"
		if [ "$state" == "failed" ] ; then
		  exit 1
		elif [ "$state" == "passed" ] ; then
		  exit 0
		else
                  exit 1
		fi
  	fi
done

