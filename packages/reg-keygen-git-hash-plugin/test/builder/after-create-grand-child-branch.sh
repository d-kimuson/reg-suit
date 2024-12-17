fixture_dir="fixtures/after-create-grand-child-branch"
cd test
rm -rf $fixture_dir

child_branch_name="child"
grand_child_branch_name="grand-child_"

git init
git commit --allow-empty -m "first commit"
sleep 1s
git commit --allow-empty -m "second commit"
sleep 1s
git tag "expected"
sleep 1s
git checkout -b $child_branch_name
git commit --allow-empty -m "child branch commit (1)"
sleep 1s
git checkout -b $grand_child_branch_name # endsWith で検知してるからズラす必要がある
git commit --allow-empty -m "grand-child branch commit"
sleep 1s
git checkout $child_branch_name
git commit --allow-empty -m "child branch commit (2)"
sleep 1s

mv .git $fixture_dir
rm -rf .git
