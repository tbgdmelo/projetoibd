FROM python:3

WORKDIR /usr/frontend/

COPY /semantic/ ./

EXPOSE 8001

CMD ["python3","-m",  "http.server", "8001"]