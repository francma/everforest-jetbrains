MAKEFLAGS += --no-builtin-rules --no-builtin-variables
.DEFAULT_GOAL := build

define theme_target_json_file
$(patsubst %, build/theme/everforest_%.theme.json, $(1))
endef

define theme_target_xml_file
$(patsubst %, build/theme/everforest_%.xml, $(1))
endef

define theme_source_env_files
$(patsubst %, src/pallete_%.env, $(1)) src/defines.env
endef

DIRS := build build/META-INF build/theme
$(shell mkdir -p $(DIRS))

XML_SOURCES := src/theme.xml $(wildcard src/includes/*.xml)
JSON_SOURCES := $(wildcard src/*.json)

define theme_rule
$(call theme_target_json_file, $(1)): $(call theme_source_env_files, $(1)) $(JSON_SOURCES)
	cat $(JSON_SOURCES) | ./bin/template.sh $(call theme_source_env_files, $(1)) > $$@
$(call theme_target_xml_file, $(1)): $(call theme_source_env_files, $(1)) $(XML_SOURCES)
	cat src/theme.xml | ./bin/template.sh $(call theme_source_env_files, $(1)) > $$@
endef

THEMES := dark_hard dark_medium dark_soft light_hard light_medium light_soft
$(foreach theme, $(THEMES), $(eval $(call theme_rule, $(theme))))

build/META-INF/plugin.xml: $(call theme_source_env_files, $(1)) src/plugin.xml
	cat src/plugin.xml | ./bin/template.sh $(call theme_source_env_files, $(1)) > $@

TARGET_XML_FILES := $(call theme_target_xml_file, $(THEMES))
TARGET_JSON_FILES := $(call theme_target_json_file, $(THEMES))
TARGETS := $(TARGET_XML_FILES) $(TARGET_JSON_FILES) build/META-INF/plugin.xml

build: $(TARGETS)

clean:
	rm -rf build

release: build
	./bin/release.sh

lint: build
	xmllint --valid --noout build/theme/*.xml
	jq empty build/theme/*.json