# Problem
[String Calculator Kata](https://osherove.com/tdd-kata-1/) is a TDD Kata - an exercise in coding, refactoring and test-first

# Development setup
The solution is attempted with plain Ruby (3.3.4) and uses Minitest as the testing framework.

To setup the environment, open this with Dev Containers extension in VSCode.
If you don't prefer to use VSCode, use the [devcontainers CLI](https://www.npmjs.com/package/@devcontainers/cli) to open the container with the following commands:


```bash
npm install -g @devcontainers/cli
devcontainer up --workspace-folder .
devcontainer exec --workspace-folder . bash # opens a bash terminal inside the container
```

```bash
# inside the container
rake test
```
