all: clean
	sudo ./test-live-helper.sh > build.log 2> error.log

clean:
	sudo lh clean --purge
	sudo rm -rf config

drbl-hadoop: clean
	sudo ./create-hadoop-live-by-pkg -m http://free.nchc.org.tw/debian -s http://free.nchc.org.tw/debian-security -e unstable > build.log 2> error.log
