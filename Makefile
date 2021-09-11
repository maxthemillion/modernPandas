.PHONY: install clean flake black docker_build docker_run test

help:
	@echo "install		installs conda environment as specified in environment.yml"
	@echo "clean		removes python artifacts such as __pycache__ files"
	@echo "flake		runs flake8 on the working directory to check for code style violations"
	@echo "black		runs code formatter black on the working directory"
	@echo "d_build		builds docker image as specified in Dockerfile"
	@echo "d_run		runs docker container, mounts cwd and forwards configured ports to jupyter lab"
	@echo "test		runs pytest"
	@echo "datasette	converts all csv files in ./data to a sqlite.db and hosts it with datasette"

install:
	conda env create -f environment.yml

clean:
	rm -rf __pycache__ .pytest_cache

flake:
	flake8 .

black: 
	black .

test:
	pytest -q
