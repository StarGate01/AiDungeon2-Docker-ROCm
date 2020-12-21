FROM rocm/pytorch

ADD ./test /app/test/
WORKDIR /app/test

CMD ./test.py