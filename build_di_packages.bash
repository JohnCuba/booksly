for d in ./packages/*; do
    cd "$d"
    echo "$d"
    dart run build_runner build
    echo "\n"
    cd ..
done