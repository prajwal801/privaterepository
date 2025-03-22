git fetch origin
git checkout main
for branch in $(git branch -r | grep 'origin/ready'); do
  local_branch=${branch#origin/}
  git checkout -b $local_branch $branch
  git checkout main
  git merge $local_branch
  git branch -d $local_branch
done
for branch in $(git branch -r | grep 'origin/update'); do
  local_branch=${branch#origin/}
  git checkout -b $local_branch $branch
  git merge main
done
git checkout main
