php_files  := $(wildcard src/**.php)

theme/everforest.xml: $(php_files)
	cd src/ && cat pallete.php theme.icls.php | php > ../theme/everforest.xml

clean:
	rm -f theme/everforest.xml everforest.jar

release: theme/everforest.xml
	jar --create --file everforest.jar META-INF theme