DIRS := ex00 ex01 ex02
# ex03 ex04

GREEN := \033[32m
RED := \033[31m
GRAY := \033[90m
RESET := \033[0m

OK := $(GREEN)✓$(RESET)
DEL := $(RED)✗$(RESET)

ARROW_IN := $(GRAY)↳$(RESET)
ARROW_OUT := $(GRAY)↲$(RESET)

all:
	@for d in $(DIRS); do \
		echo "$(ARROW_IN) enter $$d"; \
		$(MAKE) --no-print-directory -C $$d; \
		echo "$(ARROW_OUT) exit $$d"; \
	done

clean:
	@for d in $(DIRS); do \
		echo "$(ARROW_IN) enter $$d"; \
		$(MAKE) --no-print-directory -C $$d clean; \
		echo "$(ARROW_OUT) exit $$d"; \
	done

fclean:
	@for d in $(DIRS); do \
		echo "$(ARROW_IN) enter $$d"; \
		$(MAKE) --no-print-directory -C $$d fclean; \
		echo "$(ARROW_OUT) exit $$d"; \
	done

re: fclean all

run:
	@for d in $(DIRS); do \
		name=$$(basename $$d); \
		exec=$$d/$$name; \
		if [ -x "$$exec" ]; then \
			printf "$(GRAY)─── running %s ───$(RESET)\n" "$$exec"; \
			./$$exec; \
		else \
			printf "$(DEL) %s not found\n" "$$exec"; \
		fi \
	done

run%:
	@d=ex0$*/; \
	name=$$(basename $$d); \
	exec=$$d$$name; \
	if [ -x "$$exec" ]; then \
		printf "$(GRAY)─── running %s ───$(RESET)\n" "$$exec"; \
		./$$exec; \
	else \
		printf "$(DEL) %s not found\n" "$$exec"; \
		exit 1; \
	fi

.PHONY: all clean fclean re run $(DIRS) run run%
