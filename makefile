# Run dev enviorments for theory of prog Ceaser Ciphers
# Author:  Daniel Nicolas Gisolfi

intro:
	@echo "\nCMPT331 Ceaser Ciphers"

fortran: intro
	@docker run --rm --name fortran_dev -it -v ${PWD}/Fortran:/DEV/Fortran dgisolfi/fortran_dev bash

basic: intro
	@docker run --rm --name basic_dev -it -v ${PWD}/BASIC:/DEV/BASIC dgisolfi/basic_dev bash

pascal: intro
	@docker run --rm --name pascal_dev -it -v ${PWD}/Pascal:/DEV/Pascal dgisolfi/pascal_dev bash

scala: intro
	@docker run --rm --name scala_dev -it -v ${PWD}/Scala:/DEV/Scala dgisolfi/scala_dev bash

cobol: intro
	@docker run --rm --name cobol_dev -it -v ${PWD}/COBOL:/DEV/COBOL dgisolfi/cobol_dev bash
