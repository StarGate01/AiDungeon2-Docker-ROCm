FROM rocm/pytorch

RUN apt-get update && \
    apt-get -y install aria2 git unzip wget python3-venv netbase && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip setuptools && \
    pip3 install git+https://github.com/finetuneanon/transformers.git@gpt-neo-dungeon-localattention1#egg=transformers && \
    pip3 install Flask Flask-SocketIO requests werkzeug

ADD ./test /app/test/

ENV TRANSFORMERS_CACHE /app/cache/
WORKDIR /app/game
CMD python3 aiserver.py