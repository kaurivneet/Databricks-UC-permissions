docker run -d     --tty --interactive     --user $(id -u):$(id -g)     --volume $(pwd):/Databricks     --volume ~/.gitconfig:/.gitconfig --volume ~/.ssh/id_versent:/.ssh/id_versent    dbr_platform:latest terragrunt run-all plan --terragrunt-working-dir /