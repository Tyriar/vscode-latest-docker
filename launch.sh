# Make directories here otherwise they will be created with permissions that are too restrictive
mkdir -p .vscode
mkdir -p user-data-dir

# Launch VS Code
sudo docker run -ti -e DISPLAY --net=host \
    -v $HOME/.Xauthority:/home/dummy/.Xauthority \
    -v $HOME/dev:/home/dummy/dev \
    -v $(pwd)/user-data-dir:/home/dummy/.config/Code \
    -v $(pwd)/.vscode:/home/dummy/.vscode \
    vscode
