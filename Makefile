gen:
	make clean
	hugo -v

server:
	make clean
	hugo server -w -v

update:
	make clean

	-git commit -a

	echo -n "Proceeding to website update. Make sure you have asciidoctor gem ready. Press Enter to continue or CTRL+C to abort now.";
	read

	git push origin HEAD:source

	make gen

	cd public && git add * && git commit -am "Website update" && git push --force origin HEAD:master

	make clean

clean:
	rm -rf ./public/*
