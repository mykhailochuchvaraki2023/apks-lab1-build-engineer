---
name: build-and-test
description: Налаштування конфігурації складання Cargo.toml, юніт-тесту basic_addition та кросплатформних скриптів ci.sh і ci.bat.
---

# Коли застосовувати
Використовувати після створення каркаса проєкту або під час виклику `/create-build`.

# Вхідні дані
- Наявні файли `src/lib.rs` та `src/main.rs`.

# Очікувані результати
1. `Cargo.toml` з назвою пакета `hello`, версією `0.1.0` та `edition = "2021"`.
2. `tests/test_basic.rs` з тестом `#[test] fn basic_addition()`, що перевіряє `hello::add(2, 3) == 5`.
3. `ci.sh` (для Linux/macOS) та `ci.bat` (для Windows), які виконують `cargo test --release`, `cargo build --release` та копіюють виконуваний файл `hello` (`hello.exe` на Windows) до каталогу `dist/`.

# Приклад входу та результату
- **Вхід:** `src/lib.rs`, `src/main.rs`
- **Результат:** `Cargo.toml`, `tests/test_basic.rs`, `ci.sh`, `ci.bat` та зібраний бінарник у `dist/`.

# Перевірка результату
- Виконання `cargo test --release` завершується зі статусом `test result: ok` для `basic_addition`.
- Запуск `./ci.sh` (Linux/macOS) або `ci.bat` (Windows) створює `dist/hello` або `dist\hello.exe`, запуск якого виводить `HELLO, WORLD!`.

# Типовий сценарій помилки
- Якщо утиліта `cargo` не знайдена в `PATH` — зупинити виконання та вивести повідомлення про відсутність Rust toolchain.
- Якщо компіляція або тест `basic_addition` падають — повернути помилку з виводом `cargo` без створення `dist/`.