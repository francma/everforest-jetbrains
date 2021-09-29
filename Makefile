SOURCE_FILES = $(shell find src -type f -name "*.php")

theme/everforest.xml: $(SOURCE_FILES)
	cd src/ && cat pallete.php theme.icls.php | php > ../theme/everforest.xml

clean:
	rm -f theme/everforest.xml everforest.jar

release: theme/everforest.xml
	jar --create --file everforest.jar META-INF theme