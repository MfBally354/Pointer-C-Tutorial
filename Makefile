# Makefile untuk kompilasi semua contoh pointer

CC = gcc
CFLAGS = -Wall -Wextra -std=c11

# Direktori
DIR_BASIC = 01-basic
DIR_FUNC = 02-functions
DIR_ARRAY = 03-arrays
DIR_ERROR = 04-common-errors

# Target files
BASIC_TARGETS = $(DIR_BASIC)/pointer_dasar $(DIR_BASIC)/alamat_memori
FUNC_TARGETS = $(DIR_FUNC)/pass_by_value $(DIR_FUNC)/pass_by_pointer $(DIR_FUNC)/swap_values
ARRAY_TARGETS = $(DIR_ARRAY)/pointer_array $(DIR_ARRAY)/string_pointer
ERROR_TARGETS = $(DIR_ERROR)/null_pointer $(DIR_ERROR)/dangling_pointer

ALL_TARGETS = $(BASIC_TARGETS) $(FUNC_TARGETS) $(ARRAY_TARGETS) $(ERROR_TARGETS)

.PHONY: all clean help run-all

# Compile semua
all: $(ALL_TARGETS)
	@echo "✅ Semua program berhasil dikompilasi!"

# Compile individual directories
basic: $(BASIC_TARGETS)
functions: $(FUNC_TARGETS)
arrays: $(ARRAY_TARGETS)
errors: $(ERROR_TARGETS)

# Pattern rule untuk kompilasi
%: %.c
	@echo "🔨 Compiling $<..."
	@$(CC) $(CFLAGS) $< -o $@

# Run semua program
run-all: all
	@echo "\n=== RUNNING: 01-basic ==="
	@for target in $(BASIC_TARGETS); do \
		echo "\n--- Running $$target ---"; \
		./$$target; \
	done
	@echo "\n=== RUNNING: 02-functions ==="
	@for target in $(FUNC_TARGETS); do \
		echo "\n--- Running $$target ---"; \
		./$$target; \
	done
	@echo "\n=== RUNNING: 03-arrays ==="
	@for target in $(ARRAY_TARGETS); do \
		echo "\n--- Running $$target ---"; \
		./$$target; \
	done
	@echo "\n=== RUNNING: 04-common-errors ==="
	@for target in $(ERROR_TARGETS); do \
		echo "\n--- Running $$target ---"; \
		./$$target; \
	done

# Clean compiled files
clean:
	@echo "🧹 Cleaning..."
	@rm -f $(ALL_TARGETS)
	@echo "✅ Clean complete!"

# Help
help:
	@echo "📚 Pointer C Tutorial - Makefile Commands"
	@echo ""
	@echo "Usage:"
	@echo "  make          - Compile semua program"
	@echo "  make basic    - Compile hanya 01-basic"
	@echo "  make functions- Compile hanya 02-functions"
	@echo "  make arrays   - Compile hanya 03-arrays"
	@echo "  make errors   - Compile hanya 04-common-errors"
	@echo "  make run-all  - Compile dan jalankan semua"
	@echo "  make clean    - Hapus semua file hasil compile"
	@echo "  make help     - Tampilkan help ini"
