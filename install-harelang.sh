# Prevent problem with SSL verification I had
git config --global http.sslverify false

# Get the QBE backend
cd ~
git clone git://c9x.me/qbe.git 
cd qbe
sudo make install
cd -

# Get the harec compiler
git clone https://git.sr.ht/~sircmpwn/harec
cd harec
./configure
make check
sudo make install
cd -

# Get the hare stdlib
git clone https://git.sr.ht/~sircmpwn/hare
cd hare
sh hare.sh
cp config.example.mk config.mk
make check
sudo make install
cd -

git config --global http.sslverify true

echo """ 
use fmt;

export fn main() void = {
	fmt::println(\"Hello world!\")!;
};
""" > /tmp/hello.ha

hare run /tmp/hello.ha
