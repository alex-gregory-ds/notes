# Exit if not on the main branch
if [[ `git rev-parse --abbrev-ref HEAD` != "main" ]]; then
    echo "Must be on the main branch."
    exit 1
fi

# Exit if there are uncommitted changes outside the docs/ directory
if [[ `git status --short --porcelain --untracked-files=no | grep -v 'docs/'` ]]; then
    echo "Docs cannot be deployed if there are uncommited changes outside the docs/ directory."
    exit 1
fi

cd notes
make github
cd ..

# Commit all changes in the docs directory
git add docs/
CURRENT_COMMIT_HASH=`git rev-parse --short HEAD`
git commit -m "Deployed docs from commit $CURRENT_COMMIT_HASH"

