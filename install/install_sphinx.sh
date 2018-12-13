sudo apt-get update
sudo apt-get install python3-pip -y
pip3 install -U --user sphinx
pip3 install sphinx_rtd_theme

echo 'export PATH=$PATH:~/.local/' >> ~/.bashrc
