find . -name 'init-foreground.sh' -print0 | while read -d $'\0' file
do
    echo "echo "Waiting to complete"; while [ ! -f /opt/.backgroundfinished ] ; do sleep 2; done; echo "Done"" > $file
done