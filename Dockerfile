FROM rocm/pytorch

RUN apt-get update && \
    apt-get -y install aria2 git unzip wget python3-venv && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools && \
    pip install transformers==2.3.0

ADD ./test /app/test/

RUN git clone https://github.com/cloveranon/Clover-Edition.git /app/game
WORKDIR /app/game

CMD python3 play.py