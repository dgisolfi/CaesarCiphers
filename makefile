# Run dev enviorments for theory of prog Ceaser Ciphers
# Author:  Daniel Nicolas Gisolfi

#####################
# Define all images #
#####################

# Procedural Languages
f_image=dgisolfi/fortran_dev
b_image=dgisolfi/basic_dev
p_image=dgisolfi/pascal_dev
s_image=dgisolfi/scala_dev
c_image=dgisolfi/cobol_dev

# Functional Languages
l_image=dgisolfi/lisp_dev
m_image=dgisolfi/ml_dev
e_image=dgisolfi/erlang_dev
h_image=dgisolfi/haskell_dev

intro:
	@echo "\nCMPT331 Ceaser Ciphers"

clean:
	# Prepare yourself this is gonna be a lot of cleaning

	# clean each container
	-docker kill fortran_dev && docker rm fortran_dev
	-docker kill basic_dev && docker rm basic_dev
	-docker kill pascal_dev && docker rm pascal_dev
	-docker kill scala_dev && docker rm scala_dev
	-docker kill cobol_dev && docker rm cobol_dev
	-docker kill lisp_dev && docker rm lisp_dev
	-docker kill ml_dev && docker rm ml_dev
	-docker kill erlang_dev && docker rm erlang_dev
	-docker kill haskell_dev && docker rm haskell_dev

	# clean each image
	-docker rmi $(f_image)
	-docker rmi $(b_image)
	-docker rmi $(p_image)
	-docker rmi $(s_image)
	-docker rmi $(c_image)
	-docker rmi $(l_image)
	-docker rmi $(m_image)
	-docker rmi $(e_image)
	-docker rmi $(h_image)


###########################
# Procedural Environments #
###########################

fortran: intro
	@docker run --rm --name fortran_dev -it -v ${PWD}/Fortran:/DEV/Fortran $(f_image) bash

basic: intro
	@docker run --rm --name basic_dev -it -v ${PWD}/BASIC:/DEV/BASIC $(b_image) bash

pascal: intro
	@docker run --rm --name pascal_dev -it -v ${PWD}/Pascal:/DEV/Pascal $(p_image) bash

scala: intro
	@docker run --rm --name scala_dev -it -v ${PWD}/Scala:/DEV/Scala $(s_image) bash

cobol: intro
	@docker run --rm --name cobol_dev -it -v ${PWD}/COBOL:/DEV/COBOL $(c_image) bash


###########################
# Functional Environments #
###########################

lisp: intro
	@docker run --rm --name lisp_dev -it -v ${PWD}/LISP:/DEV/LISP $(l_image) bash
	
ml: intro
	@docker run --rm --name ml_dev -it -v ${PWD}/ML:/DEV/ML $(m_image) bash	
	
erlang: intro
	@docker run --rm --name erlang_dev -it -v ${PWD}/Erlang:/DEV/Erlang $(e_image) bash

haskell: intro
	@docker run --rm --name haskell_dev -it -v ${PWD}/Haskell:/DEV/Haskell $(h_image) bash