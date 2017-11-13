for dirname in $(find ./* -type d); do
	cd $dirname

	gzip -9fnk image.svg
	/opt/brotli/bin/bro --force --quality 11 --input image.svg --output image.svg.br
	gzthermal -n image.svg.gz
	mv gzthermal-result.png gzthermal.png
	gzthermal -n -z image.svg.gz
	mv gzthermal-result.png backrefs.png
	defdb -t image.svg.gz > defdb.txt
	defdb -s image.svg.gz > bitlength.txt

	cd ..
done