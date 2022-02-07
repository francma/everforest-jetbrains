build:
	./build.sh

clean:
	rm -f theme/* everforest.jar

release: build
	rm -f everforest.jar
	zip -r everforest.jar META-INF/ theme/

lint: build
	xmllint --valid --noout theme/*.xml
	jq empty theme/*.json