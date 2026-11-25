# MILSIM UZ — Makefile
# make        -> src/ dan dist/MilsimUZ.html ni yig'adi
# make run    -> o'yinni brauzerda ochadi
# make test   -> avtomatik testlar (Node.js + Playwright kerak)
# make clean  -> yig'ilgan faylni o'chiradi

PY ?= python3
OUT = dist/MilsimUZ.html

.PHONY: all run test clean

all: $(OUT)

$(OUT): build.py $(wildcard src/*.js src/*.css src/*.html)
	$(PY) build.py

run: $(OUT)
	sh launcher/MILSIM_UZ.sh

test: $(OUT)
	@for t in test/*.cjs; do case $$t in */lib.cjs) continue;; esac; echo "== $$t"; node $$t || exit 1; done

clean:
	rm -f $(OUT)
