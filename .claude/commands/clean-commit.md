---
name: clean-commit
description: Remove logs and clean the project before committing
---

# Clean Commit

Remove all log files and build artifacts, then create a clean commit.

## Steps

1. Remove all .log files from the project
2. Clean Swift build artifacts (.build directory)
3. Remove DerivedData if present
4. Clean any Xcode build folders
5. Show git status and create a commit with the cleaned state
