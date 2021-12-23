FROM amazon/aws-lambda-nodejs:14
LABEL maintainer="Abhik Chakraborty"
COPY . ${LAMBDA_TASK_ROOT}

RUN npm ci
CMD ["server.handler"]
