all: clean
	sudo ./test-live-helper.sh > build.log 2> error.log

clean:
	sudo lh clean --purge
	sudo rm -rf config
	sudo rm build.log error.log
