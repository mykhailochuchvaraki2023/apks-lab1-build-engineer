---
name: github-actions
description: Генерація CI workflow у .github/workflows/ci.yml для Windows, Linux та macOS із викликом скриптів ci.sh і ci.bat.
---

# Коли застосовувати
Використовувати після налаштування скриптів складання `ci.sh` та `ci.bat` або під час виклику `/create-actions`.

# Вхідні дані
- Наявні скрипти `ci.sh` та `ci.bat` у корені репозиторію.

# Очікувані результати
- Файл `.github/workflows/ci.yml`, який:
  - запускається на `push` та `pull_request` до гілок `develop` і `master`;
  - використовує одну `job` із `strategy.matrix.os: [ubuntu-latest, windows-latest, macos-latest]`;
  - виконує `actions/checkout@v4`, встановлення Rust toolchain (`dtolnay/rust-toolchain@stable`), запуск `bash ci.sh` (на Linux/macOS) або `ci.bat` (на Windows) та завантаження артефакта `dist/` через `actions/upload-artifact@v4`.

# Приклад входу та результату
- **Вхід:** `ci.sh`, `ci.bat`
- **Результат:** валідний YAML-файл `.github/workflows/ci.yml`.

# Перевірка результату
- Файл `.github/workflows/ci.yml` має коректний синтаксис YAML.
- У матриці присутні всі три ОС (`ubuntu-latest`, `windows-latest`, `macos-latest`).
- Workflow викликає саме `ci.sh` / `ci.bat`, а не дублює команди збірки напряму, і не містить секретів.

# Типовий сценарій помилки
- Якщо відсутні `ci.sh` або `ci.bat` — не генерувати workflow і повідомити про необхідність спершу виконати `/create-build`.