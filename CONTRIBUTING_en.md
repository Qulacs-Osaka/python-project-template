# How to contribute
## Prerequisite
Install poetry. This tool resolves dependencies, build the package, and publish it.

Installation in Linux and macOS:
```bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
```

And installation in Windows:
```bash
(Invoke-WebRequest -Uri https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py -UseBasicParsing).Content | python -
```

For detailed instruction, refer to [poetry documentation](https://python-poetry.org/docs/#installation).

## Start coding
1. Clone this repository.
2. Synchronize with `main` branch.
```bash
git switch main
git pull
```

3. Create branch with name describing a feature you are going to develop. Branch name format is `${ISSUE_NUMBER}/${FEATURE}`
```bash
git switch -c 99-wonderful-model
```

4. Install dependencies. This is not needed when there is no dependency installed recently.
```bash
poetry install
```

5. Format, lint, and test your code.
```
make test
make check
```

6. After modification, commit and push changes.
```bash
git add -p
git commit
# For the first push in the branch
git push -u origin 99-wonderful-model
# After first push
git push
```

7. Create a pull request(PR) after you finish the development at the branch. Basically you need someone to review your code. If modification is subtle, you might not need a review. After reviewer approved and All CI passed.

## Testing
Write tests when you develop a new feature. Tests are executed automatically.

1. Create `test_*.py` in `tests` directory. Describe what to test in the file name.
2. Create a function whose name starts with `test_`. Write assertion to check if a function you developed is compliant with a specification. For example, a test for a function calculating sum of two integers is like following.
```python
from your_module import add
def test_add():
    assert 3 == add(1, 2)
```

3. Then run tests.
```bash
make test
```
If the assertion fails, error contents are displayed with red. If you do not see that, all test are successful.

You might want to run tests only in specific files.
In that case, run `make` with file(s) you want to test.
```
make tests/test_sample.py
```

We use `pytest` for testing. Detailed instructions are available in the [document](https://docs.pytest.org/en/6.2.x/).

## CI
Run CI at GitHub Actions. You cannot merge a branch unless CI passes.
In CI, we run tests and check code format and linter error.
The purpose of CI is
* Share our code works properly in the team.
* Find error you cannot notice at your local machine.
* Avoid unnecessary diff by forcing code format and linter error.
