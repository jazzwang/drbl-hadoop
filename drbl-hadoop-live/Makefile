all: clean
	sudo ./create-hadoop-live-by-pkg -m http://free.nchc.org.tw/debian -s http://free.nchc.org.tw/debian-security -e unstable > build.log 2> error.log

test: clean
	sudo ./test-live-helper.sh > build.log 2> error.log

clean:
	sudo lb clean --purge
	sudo rm -rf config auto
dist-clean: clean
	sudo rm -f build.log error.log
