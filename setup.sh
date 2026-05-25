#!/bin/bash

# Exit on error
set -e

# 1. Commit 1
echo "Typo fix" >> README.md
git add README.md
git commit -m "Fix typos in README"

# 2. Commit 2
echo "Updated dependencies" > dependencies.txt
git add dependencies.txt
git commit -m "Update project dependencies"

# 3. Commit 3
echo "Formatted README" >> README.md
git add README.md
git commit -m "Improve README formatting"

# 4. Non-interactive rebase (reorder + squash)
GIT_SEQUENCE_EDITOR="sed -i '1s/^pick/edit/;3s/^pick/squash/;2s/^pick/pick/'" \
git rebase -i HEAD~3

# 5. Amend message for squashed commit
git commit --amend -m "Updated README"

# 6. Continue rebase (ignore error if already completed)
git rebase --continue || true

# 7. Revert second commit
git revert --no-edit HEAD~1

# 8. Show final history
git log --oneline
