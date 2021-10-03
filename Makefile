SOURCE_FILES = $(shell find src -type f -name "*.php")

all: theme/everforest.xml theme/everforest.theme.json

theme/everforest.xml: $(SOURCE_FILES)
	cd src/ && cat pallete.php theme.icls.php | php > ../theme/everforest.xml

theme/everforest.theme.json: $(SOURCE_FILES)
	cd src/ && cat pallete.php everforest.theme.json.php | php > ../theme/everforest.theme.json

clean:
	rm -f theme/everforest.xml theme/everforest.theme.json everforest.jar

release: theme/everforest.xml
	jar --create --file everforest.jar META-INF theme