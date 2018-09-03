# Run dev enviorments for theory of prog Ceaser Ciphers
# Author:  Daniel Nicolas Gisolfi

intro:
	@echo "\nCMPT331 Ceaser Ciphers"

basic: intro
	@docker run --rm --name basic_dev -it -v ${PWD}/BASIC:/DEV/BASIC dgisolfi/basic_dev bash

pascal: intro
	@docker run --rm --name pascal_dev -it -v ${PWD}/Pascal:/DEV/Pascal dgisolfi/pascal_dev bash