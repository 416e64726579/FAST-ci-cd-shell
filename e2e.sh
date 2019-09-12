####
echo "Create test run"

TESTRUN=$(./create_test_run.sh $WALARM_UUID $WALARM_SECRET)
TEST_RECORD_ID=$(echo $TESTRUN | sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}'|grep "\"test_record_id\":" | awk -F ':' '{ print $2 }' | sed -e 's/"//g')
TEST_ID=$(echo $TESTRUN | sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}'|grep "\"id\":" | awk -F ':' '{ print $3 }' | sed -e 's/"//g')

echo "Test run in paused state created: $TESTRUN"


# #### Note: No need if you use gitlab ci/cd pipeline as here is service up
 echo "Run fast"
 (./start_fast.sh)
 sleep 20

echo "Wait until fast is ready"
(./wait_fast.sh $WALARM_UUID $WALARM_SECRET $TEST_ID)

####
echo "Run e2e tests (curl commands to app). Recording baselines"
(./test_app.sh)
sleep 10

####
echo "Stop recording baselines"
(./stop_recording.sh $WALARM_UUID $WALARM_SECRET $TEST_RECORD_ID)
sleep 10

####
echo "Start running security tests"
(./start_security_test.sh $WALARM_UUID $WALARM_SECRET $TEST_ID)
sleep 10

####
echo "Wait untill tests have passed"
(./wait_test_run.sh $WALARM_UUID $WALARM_SECRET $TEST_ID)

#### Note: No need 'cause the container will be destroyed by gitlab-ci job script
#echo "Stop fast"
#(./stop_fast.sh)

#exit
