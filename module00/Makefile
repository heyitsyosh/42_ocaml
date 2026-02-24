DIRS = ex00 ex01 ex02 ex03 ex05 ex08
# ex06 ex04 ex07 ex09
BUILD_DIR = _build
OCAMLOPT = ocamlopt

# ----------------- Formatting ------------------

GREEN	= \033[32m
RED		= \033[31m
GRAY	= \033[90m
RESET	= \033[0m

OK		= $(GREEN)✓$(RESET)
DEL		= $(RED)✗$(RESET)

# ------------------- Rules --------------------

all: $(DIRS)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(DIRS): | $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)/$@; \
	src=$$(ls $@/*.ml); \
	base=$$(basename $$src .ml); \
	\
	$(OCAMLOPT) -c -o $(BUILD_DIR)/$@/$$base.cmx $$src && \
	printf "$(OK) ocamlopt -c  %s\n" "$$src"; \
	\
	$(OCAMLOPT) -c -I $(BUILD_DIR)/$@ -o $(BUILD_DIR)/$@/$@_test.cmx tests/$@_test.ml && \
	printf "$(OK) ocamlopt -c  tests/%s_test.ml\n" "$@"; \
	\
	$(OCAMLOPT) -o $@/$@_test \
		$(BUILD_DIR)/$@/$$base.cmx \
		$(BUILD_DIR)/$@/$@_test.cmx && \
	printf "$(OK) ocamlopt -o  %s/%s_test\n" "$@" "$@"; \
	printf "$(OK) $(GREEN)%s_test compiled successfully$(RESET)\n" "$@"

run:
	@for d in $(DIRS); do \
		exec="$$d/$$d"_test; \
		if [ -x "$$exec" ]; then \
			printf "$(GRAY)─── running %s ───$(RESET)\n" "$$exec"; \
			./$$exec; \
		fi; \
	done

run%:
	@ex="ex$*"; \
	exec="$$ex/$$ex"_test; \
	if [ -x "$$exec" ]; then \
		printf "$(GRAY)─── running %s ───$(RESET)\n" "$$exec"; \
		./$$exec; \
	else \
		printf "$(DEL) %s not found or not executable\n" "$$exec"; \
	fi

clean:
	@rm -rf $(BUILD_DIR)
	@echo "$(DEL) rm -rf  $(BUILD_DIR)/"

fclean: clean
	@rm -f $(foreach d,$(DIRS),$(d)/$(d)_test)
	@printf "$(DEL) rm -f   executables - %s\n" "$(foreach d,$(DIRS),$(d)/$(d)_test)"

re: fclean all

.PHONY: all clean fclean re $(DIRS) run run%
