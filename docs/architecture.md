# Архітектура AI-агента `build-engineer`

## Які проблеми вирішує агент
Агент стандартизує та автоматизує створення кросплатформного Rust-проєкту (Hello World), налаштування складання через Cargo, юніт-тестування, скрипти збірки (`ci.sh`, `ci.bat`) і CI workflow у GitHub Actions для Windows, Linux та macOS[cite: 1, 5, 8, 9]. Це зменшує ризик пропустити тест, не оновити `.gitignore` (щоб не потрапили `target/`, `dist/` і секрети) або зробити розбіжності між локальною збіркою і CI[cite: 1, 4, 10].

## Компоненти агента у VS Code Copilot
- **Manifest** (`.github/agents/build-engineer.agent.md`) — роль агента, правила роботи з файлами, заборонені дії та критерії завершення[cite: 1, 8].
- **Skills** (`.github/skills/*/SKILL.md`) — `project-scaffold`, `build-and-test`, `github-actions` (з входами, виходами, перевірками та діями при помилці)[cite: 1, 5, 8].
- **Commands** (`.github/prompts/*.prompt.md`) — `git-init`, `create-project`, `create-build`, `create-actions`, `check` (режим тільки читання з таблицею PASS/FAIL) та оркестратор `init`[cite: 1, 8, 9].

## Передача даних і обробка помилок
Команда `init` послідовно запускає `git-init` -> `create-project` -> `create-build` -> `create-actions` -> `check`[cite: 1, 9]. Кожен крок спирається на файли, створені на попередньому етапі, та перевіряє умови готовності[cite: 5, 9]. При помилці на будь-якому кроці або статусі `FAIL` у `check` оркестратор зупиняється та не вважає виконання успішним[cite: 1, 5, 9].