FROM devopsinfra/docker-terragrunt:aws-azure-tf-1.3.6-tg-0.42.2

# RUN apt-get update && apt-get install -y --no-install-recommends \
#     python3.5 \
#     python3-pip \
#     && \
# apt-get clean && \
# rm -rf /var/lib/apt/lists/*

# RUN pip install --upgrade databricks-cli
WORKDIR /Databricks
COPY . /
COPY ./docker/requirements.txt ./
COPY ./.git/config ./.gitconfig
RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt


# # Project initialization:
# RUN poetry config virtualenvs.create false \
#   && poetry install --no-interaction --no-ansi --no-root


# ENTRYPOINT ["tail", "-f", "/dev/null"]