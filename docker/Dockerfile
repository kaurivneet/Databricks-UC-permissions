FROM public.ecr.aws/amazonlinux/amazonlinux:latest



RUN amazon-linux-extras enable python3.8
RUN yum install -y python3.8
RUN yum install -y wget unzip
RUN yum -y update
RUN yum install -y amazon-linux-extras git
COPY ./docker/requirements.txt ./
RUN python3.8 -m pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt

RUN wget --quiet https://releases.hashicorp.com/terraform/1.3.6/terraform_1.3.6_linux_amd64.zip
RUN unzip -o terraform_1.3.6_linux_amd64.zip
RUN mv terraform /usr/bin/terraform
RUN rm terraform_1.3.6_linux_amd64.zip
RUN chmod +x /usr/bin/terraform 

RUN wget --quiet https://github.com/gruntwork-io/terragrunt/releases/download/v0.42.3/terragrunt_linux_amd64 \
  && mv terragrunt_linux_amd64 /usr/bin/terragrunt
RUN chmod +x /usr/bin/terragrunt  

WORKDIR /Databricks
COPY . ./
RUN --mount=type=secret,id=DATABRICKS_ACCOUNT_HOST \
    --mount=type=secret,id=DATABRICKS_ACCOUNT_ID \
    --mount=type=secret,id=DATABRICKS_ACCOUNT_USERNAME \
    --mount=type=secret,id=DATABRICKS_ACCOUNT_PASSWORD \
    --mount=type=secret,id=WORKSPACE_URL \
    --mount=type=secret,id=WORKSPACE_TOKEN \
    --mount=type=secret,id=TERRAGRUNT_DIR \
    echo "export DATABRICKS_ACCOUNT_HOST=$(cat /run/secrets/DATABRICKS_ACCOUNT_HOST)" >> $HOME/.bashrc && \
    echo "export DATABRICKS_ACCOUNT_USERNAME=$(cat /run/secrets/DATABRICKS_ACCOUNT_USERNAME)" >> $HOME/.bashrc && \
    echo "export DATABRICKS_ACCOUNT_PASSWORD=$(cat /run/secrets/DATABRICKS_ACCOUNT_PASSWORD)" >> $HOME/.bashrc && \
    echo "export TERRAGRUNT_DIR=$(cat /run/secrets/TERRAGRUNT_DIR)" >> $HOME/.bashrc && \
    echo "export WORKSPACE_TOKEN=$(cat /run/secrets/WORKSPACE_TOKEN)" >> $HOME/.bashrc && \
    echo "export WORKSPACE_URL=$(cat /run/secrets/WORKSPACE_URL)" >> $HOME/.bashrc && \
    echo "export DATABRICKS_ACCOUNT_ID=$(cat /run/secrets/DATABRICKS_ACCOUNT_ID)" >> $HOME/.bashrc
CMD ["/bin/bash","./docker/entrypoint.sh"]
