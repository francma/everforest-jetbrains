SOURCE_FILES = $(shell find src -type f -name "*.php")

all: theme/everforest_dark_hard.theme.json theme/everforest_dark_soft.theme.json theme/everforest_dark_medium.theme.json

theme/everforest_dark_hard.xml: $(SOURCE_FILES)
	cd src/ && cat pallete_dark_hard.php theme.icls.php | php > ../theme/everforest_dark_hard.xml

theme/everforest_dark_soft.xml: $(SOURCE_FILES)
	cd src/ && cat pallete_dark_soft.php theme.icls.php | php > ../theme/everforest_dark_soft.xml

theme/everforest_dark_medium.xml: $(SOURCE_FILES)
	cd src/ && cat pallete_dark_medium.php theme.icls.php | php > ../theme/everforest_dark_medium.xml

theme/everforest_dark_hard.theme.json: $(SOURCE_FILES) theme/everforest_dark_hard.xml
	cd src/ && cat pallete_dark_hard.php everforest.theme.json.php | php > ../theme/everforest_dark_hard.theme.json

theme/everforest_dark_soft.theme.json: $(SOURCE_FILES) theme/everforest_dark_soft.xml
	cd src/ && cat pallete_dark_soft.php everforest.theme.json.php | php > ../theme/everforest_dark_soft.theme.json

theme/everforest_dark_medium.theme.json: $(SOURCE_FILES) theme/everforest_dark_medium.xml
	cd src/ && cat pallete_dark_medium.php everforest.theme.json.php | php > ../theme/everforest_dark_medium.theme.json

clean:
	rm -f theme/* everforest.jar

release: all
	jar --create --file everforest.jar META-INF theme