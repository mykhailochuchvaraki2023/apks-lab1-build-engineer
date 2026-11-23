---
description: Режим тільки читання — перевіряє структуру, складання, тести, YAML workflow та стан Git і виводить таблицю PASS/FAIL.
---

Працюй виключно в режимі **тільки читання** (не створюй, не редагуй і не видаляй файли проєкту).
Перевір кожен пункт і виведи чітку таблицю зі статусами `PASS` або `FAIL`:
1. Наявність маніфесту, skills і commands у `.github/`.
2. Наявність `Cargo.toml`, `src/lib.rs`, `src/main.rs`, `tests/test_basic.rs`, `ci.sh`, `ci.bat`, `.github/workflows/ci.yml`, `.gitignore`.
3. Коректність `.gitignore` (відсутність під контролем Git `target/`, `dist/` та секретів).
4. Локальні тести (`cargo test --release`) та збірка (`ci.sh` / `ci.bat` -> `dist/hello` або `dist\hello.exe`).
5. Наявність у `.github/workflows/ci.yml` тригерів `develop`/`master` і матриці `ubuntu-latest`, `windows-latest`, `macos-latest`.

Якщо хоча б один рядок має `FAIL`, підсумковий статус перевірки — `FAILED`.