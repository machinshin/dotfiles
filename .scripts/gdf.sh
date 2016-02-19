CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
GDF=`git diff dev..HEAD | awk '/^diff / { print substr($3, 3) }'`
for file in $GDF;do
    echo $file
    echo `perl -Ilib -C $file`
done;

