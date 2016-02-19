---
layout: post
title: "Gatling Cluster"
date: 2016-02-17 20:28:25 -0500
comments: true
categories: 
  performance
---

### Performance matters
I think we can all agree that performance is one of the most important things in any application. That's why we have performance or load testing. There's a lot of tools out there we can choose from. But for this tutorial I pick [Gatling][1].

Now it's easy to say I want to generate 1,000,000 requests and hit the machine as hard as possible. In reality, your machine won't be able to do that due to OS or Network Card limitations. The most common thing is `ulimit`

Gatling has a way to [scale out][2] the test scenario to different machines but there's not enough documentation on the website.

Credit goes to [nimrodtech][3] for creating the script but I adapted a bit so if anybody wants to grab this please feel free.

My version assumes that you're using EC2 instance and the directory structures are different between the host and local.

```
#Assuming same user name for all hosts
USER_NAME='ubuntu'

#Remote hosts list
HOSTS=( IP_ADDRESSES )
PEM_FILE=~/.ssh/your_pem.pem

#You should change all of this values to suit your structure
CURRENT_DIRECTORY=$(pwd)
GATLING_LOCAL_HOME=$CURRENT_DIRECTORY/performance/gatling
GATLING_REMOTE_HOME=/home/ubuntu/gatling

GATLING_LOCAL_SIMULATIONS_DIR=$GATLING_LOCAL_HOME/user-files/simulations/
GATLING_REMOTE_SIMULATIONS_DIR=$GATLING_REMOTE_HOME/user-files/simulations/

GATLING_LOCAL_RUNNER=$GATLING_LOCAL_HOME/bin/gatling.sh
GATLING_REMOTE_RUNNER=$GATLING_REMOTE_HOME/bin/gatling.sh

#Change to your simulation class name
SIMULATION_NAME='YOUR_SIMULATION'

#No need to change this
GATLING_LOCAL_REPORT_DIR=$GATLING_LOCAL_HOME/results/
GATLING_REMOTE_REPORT_DIR=$GATLING_REMOTE_HOME/results/

GATHER_REPORTS_DIR=~/Downloads/reports/

echo "Starting Gatling cluster run for simulation: $SIMULATION_NAME"

echo "Cleaning previous runs from localhost"
rm -rf $GATLING_LOCAL_REPORT_DIR
mkdir $GATLING_LOCAL_REPORT_DIR
rm -rf $GATLING_LOCAL_REPORT_DIR

rm -rf $GATHER_REPORTS_DIR
mkdir -p $GATHER_REPORTS_DIR

for HOST in "${HOSTS[@]}"
do
  echo "Cleaning previous runs from host: $HOST"
  ssh -i $PEM_FILE -n -f $USER_NAME@$HOST "sh -c 'rm -rf $GATLING_REMOTE_REPORT_DIR'"
done

for HOST in "${HOSTS[@]}"
do
  echo "Copying simulations to host: $HOST"
  scp -i $PEM_FILE -r $GATLING_LOCAL_SIMULATIONS_DIR/* $USER_NAME@$HOST:$GATLING_REMOTE_SIMULATIONS_DIR
done

for HOST in "${HOSTS[@]}"
do
  echo "Running simulation on host: $HOST"
  ssh -i $PEM_FILE -n -f $USER_NAME@$HOST "sh -c 'nohup $GATLING_REMOTE_RUNNER -nr -s $SIMULATION_NAME > $GATLING_REMOTE_HOME/run.log 2>&1 &'"
done

echo "Running simulation on localhost"
$GATLING_LOCAL_RUNNER -nr -s $SIMULATION_NAME

echo "Gathering result file from localhost"
ls -t $GATLING_LOCAL_REPORT_DIR | head -n 1 | xargs -I {} mv ${GATLING_LOCAL_REPORT_DIR}{} ${GATLING_LOCAL_REPORT_DIR}report
cp ${GATLING_LOCAL_REPORT_DIR}report/simulation.log $GATHER_REPORTS_DIR


for HOST in "${HOSTS[@]}"
do
  echo "Gathering result file from host: $HOST"
  ssh -i $PEM_FILE -n -f $USER_NAME@$HOST "sh -c 'ls -t $GATLING_REMOTE_REPORT_DIR | head -n 1 | xargs -I {} mv ${GATLING_REMOTE_REPORT_DIR}{} ${GATLING_REMOTE_REPORT_DIR}report'"
  scp -i $PEM_FILE $USER_NAME@$HOST:${GATLING_REMOTE_REPORT_DIR}report/simulation.log ${GATHER_REPORTS_DIR}simulation-$HOST.log
done

mv $GATHER_REPORTS_DIR $GATLING_LOCAL_REPORT_DIR
echo "Aggregating simulations"
$GATLING_LOCAL_RUNNER -ro reports

#using macOSX
open ${GATLING_LOCAL_REPORT_DIR}reports/index.html
```

  [1]: http://gatling.io/#/
  [2]: http://gatling.io/docs/1.5.6/user_documentation/cookbooks/scaling_out.html
  [3]: http://www.nimrodstech.com/gatling-cluster-load-testing/
