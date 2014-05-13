#A makefile to build the merge driver

.merge/Pharo.image:
	mkdir .merge
	cd .merge; wget -O- get.pharo.org/30+vm | bash
	.merge/pharo .merge/Pharo.image --no-default-preferences eval --save Gofer new url: \'http://smalltalkhub.com/mc/ThierryGoubier/Alt30/main/\'\; package: \'GitFileTree-MergeDriver\'\; load
	git config merge.mcVersion.name "GitFileTree MergeDriver for Monticello"
	git config merge.mcVersion.driver "`pwd`/merge --version %O %A %B"
	git config merge.mcMethodProperties.name "GitFileTree MergeDriver for Monticello"
	git config merge.mcMethodProperties.driver "`pwd`/merge --methodProperties %O %A %B"
	git config merge.mcProperties.name "GitFileTree MergeDriver for Monticello"
	git config merge.mcProperties.driver "`pwd`/merge --properties %O %A %B"
	echo "*.package/monticello.meta/version merge=mcVersion" > .gitattributes
	echo "*.package/*.class/methodProperties.json merge=mcMethodProperties" >> .gitattributes
	echo "*.package/*.class/properties.json merge=mcProperties" >> .gitattributes
	

all: .merge/Pharo.image

clean:
	rm -rf .merge

