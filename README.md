# Notes

A simple sphinx static site for my personal notes.

# Install

The documentation uses `nbsphinx` to build HTML from Jupyter Notebooks. `nbsphinx` requires `pandoc` which is not pip installable. To install the dependencies using `pip`, `pandoc` must be installed first or use `conda`.

## Using pip

To install the dependencies needed to build the documentation first create and activate a virtual environment in the root of the project.

```
$ python3 -m venv .venv
$ source .venv/bin/activate
```

Then install the dependencies defined in the `pyproject.toml`.

```
$ pip install .
```

## Using conda

From the root directory of the project run the following.

```
$ conda env create -f environment.yaml
$ conda activate notes
```

