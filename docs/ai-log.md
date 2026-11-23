* **`docs/ai-log.md`**:
```markdown
# Журнал взаємодії з AI

## 1. Проєктування manifest, skills і commands
- **Запит:** сформувати роль агента `build-engineer`, скіли (`project-scaffold`, `build-and-test`, `github-actions`) та команди (`/git-init`, `/create-project`, `/create-build`, `/create-actions`, `/check`, `/init`).
- **Рішення:** винесено правила безпеки та заборону комітити `target/` і `dist/` у маніфест, а логіку перевірок у режимі «тільки читання» закріплено за `/check`.

## 2. Помилка та її виправлення
- **Помилка:** під час першого коміту маніфесту `.github/agents/build-engineer.agent.md` файл потрапив до історії порожнім (0 рядків змін), а при налаштуванні Git виникла помилка `Author identity unknown` через неналаштовані `user.name` та `user.email`.
- **Виправлення:** налаштовано глобальні `user.name` та `user.email`, заповнено й збережено маніфест, після чого виконано повторний звичайний коміт без переписування історії Git.