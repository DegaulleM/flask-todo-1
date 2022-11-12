FROM python:3 as builder 
COPY pipfile* ./ 
RUN mkdir /.venv 
RUN  pip install --upgrade pip
FROM python:3-slim 
COPY --from=builder /.venv /.venv 
WORKDIR /myapp

COPY . . 
CMD [ "python3" , "./app.py"]
