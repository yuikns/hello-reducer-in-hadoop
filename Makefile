.PHONY: all clean pipe hadoop

PWD := $(shell pwd)
Z   := 20
N   := 10

all: hadoop

hadoop: clean
	hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=$(Z) -files mapper.py,reducer.py -mapper "python2 mapper.py -n $(N) -r 0.7" -reducer "python2 reducer.py" -input "file://$(PWD)/data.csv" -output "file://$(PWD)/output"

pipe:
	cat data.csv | ./mapper.py -n $(N) | ./reducer.py

clean:
	rm -rf output
	@echo "done"
