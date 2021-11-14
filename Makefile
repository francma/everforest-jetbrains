build:
	./build.sh

clean:
	rm -f theme/* everforest.jar

release: build
	jar --create --file everforest.jar META-INF theme