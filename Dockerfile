FROM python:3.11
RUN apt-get update && apt-get install -y pandoc neovim
WORKDIR /root
RUN git clone --depth=1 https://github.com/Alex-JG3/dotfiles.git
RUN bash dotfiles/install.sh
RUN git clone https://github.com/Alex-JG3/notes.git
WORKDIR /root/notes
RUN python3 -m venv .venv && . .venv/bin/activate && pip install .
