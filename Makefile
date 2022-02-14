MAKEFLAGS += --no-builtin-rules --no-builtin-variables
.DEFAULT_GOAL := build

define theme_target_json_file
$(patsubst %, theme/everforest_%.theme.json, $(1))
endef

define theme_target_xml_file
$(patsubst %, theme/everforest_%.xml, $(1))
endef

define theme_source_env_files
$(patsubst %, src/pallete_%.env, $(1)) src/defines.env
endef

XML_SOURCES := src/theme_header.xml $(wildcard src/includes/*.xml) src/theme_footer.xml
JSON_SOURCES := $(wildcard src/*.json)

define theme_rule
$(call theme_target_json_file, $(1)): $(call theme_source_env_files, $(1)) $(JSON_SOURCES)
	cat $(JSON_SOURCES) | ./template.sh $(call theme_source_env_files, $(1)) > $$@
$(call theme_target_xml_file, $(1)): $(call theme_source_env_files, $(1)) $(XML_SOURCES)
	cat $(XML_SOURCES) | ./template.sh $(call theme_source_env_files, $(1)) > $$@
endef

THEMES := dark_hard dark_medium dark_soft light_hard light_medium light_soft
$(foreach theme, $(THEMES), $(eval $(call theme_rule, $(theme))))

TARGET_XML_FILES := $(call theme_target_xml_file, $(THEMES))
TARGET_JSON_FILES := $(call theme_target_json_file, $(THEMES))
TARGETS := $(TARGET_XML_FILES) $(TARGET_JSON_FILES)

build: $(TARGETS)

clean:
	rm -f theme/* everforest.jar

everforest.jar: build
	rm -f everforest.jar
	zip -r everforest.jar META-INF/ theme/*.json theme/*.xml

release: everforest.jar

lint: build
	xmllint --valid --noout theme/*.xml
	jq empty theme/*.json