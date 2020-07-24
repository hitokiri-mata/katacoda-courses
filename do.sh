find . -name 'init-foreground.sh' -print0 | while read -d $'\0' file
do
    cp spin.sh $file
done