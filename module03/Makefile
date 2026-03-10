DIRS = ex00 ex01 ex02 ex03
BUILD_DIR = _build
OBJ_DIR = $(BUILD_DIR)/obj
BIN_DIR = $(BUILD_DIR)/bin
OCAMLOPT = ocamlopt

# ----------------- Formatting ------------------

GREEN	= \033[32m
RED		= \033[31m
GRAY	= \033[90m
RESET	= \033[0m

OK		= $(GREEN)✓$(RESET)
DEL		= $(RED)✗$(RESET)

# ------------------- Rules --------------------

all: $(OBJ_DIR) $(BIN_DIR) $(DIRS)

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(BIN_DIR):
	@mkdir -p $(BIN_DIR)

$(DIRS): | $(OBJ_DIR) $(BIN_DIR)
	@intfs=$$(ls $@/*.mli 2>/dev/null | sort); \
	srcs=$$(ls $@/*.ml 2>/dev/null | grep -v 'main.ml' | sort); \
	if [ -z "$$srcs" ]; then \
		printf "$(DEL) no .ml files found in %s\n" "$@"; \
		exit 1; \
	fi; \
	for f in $$intfs; do \
		base=$$(basename $$f .mli); \
		$(OCAMLOPT) -c $$f -I $@ -I $(OBJ_DIR) || exit 1; \
		printf "$(OK) ocamlopt -c %s\n" "$$f"; \
		[ -f $@/$$base.cmi ] && mv $@/$$base.cmi $(OBJ_DIR)/; \
	done; \
	objs=""; \
	for f in $$srcs $@/main.ml; do \
		base=$$(basename $$f .ml); \
		$(OCAMLOPT) -c $$f -I $@ -I $(OBJ_DIR) || exit 1; \
		printf "$(OK) ocamlopt -c %s\n" "$$f"; \
		[ -f $@/$$base.cmi ] && mv $@/$$base.cmi $(OBJ_DIR)/; \
		[ -f $@/$$base.cmx ] && mv $@/$$base.cmx $(OBJ_DIR)/; \
		[ -f $@/$$base.o ] && mv $@/$$base.o $(OBJ_DIR)/; \
		objs="$$objs $(OBJ_DIR)/$$base.cmx"; \
	done; \
	$(OCAMLOPT) -o $(BIN_DIR)/$@_test -I $(OBJ_DIR) $$objs && \
	printf "$(OK) ocamlopt -o %s\n" "$(BIN_DIR)/$@_test" && \
	printf "$(OK) $(GREEN)%s_test built successfully$(RESET)\n" "$@" || exit 1

run:
	@for d in $(DIRS); do \
		exec="$(BIN_DIR)/$$d"_test; \
		if [ -x "$$exec" ]; then \
			printf "$(GRAY)─── running %s ───$(RESET)\n" "$$exec"; \
			./$$exec; \
		else \
			printf "$(DEL) %s not found\n" "$$exec"; \
		fi; \
	done

run%:
	@ex="ex0$*"; \
	exec="$(BIN_DIR)/$$ex"_test; \
	if [ -x "$$exec" ]; then \
		printf "$(GRAY)─── running %s ───$(RESET)\n" "$$exec"; \
		./$$exec; \
	else \
		printf "$(DEL) %s not found\n" "$$exec"; \
	fi

clean:
	@rm -rf $(OBJ_DIR)
	@printf "$(DEL) rm -rf %s\n" "$(OBJ_DIR)/"

fclean:
	@rm -rf $(BUILD_DIR)
	@printf "$(DEL) rm -rf %s\n" "$(BUILD_DIR)/"

re: fclean all

.PHONY: all clean fclean re $(DIRS) run run%
