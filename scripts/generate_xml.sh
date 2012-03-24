python parse.py ../friends.html source.xml
src=`pwd`
mkdir /tmp/xml
cd /tmp/xml
cat << EOF > main.cpp
#include <QDomDocument>
#include <QFile>
#include <iostream>

int main(int argc, char* argv[])
{
    QFile file(argv[1]);
    file.open(QIODevice::ReadOnly);
    QDomDocument doc("friends-quotes");
    doc.setContent(&file);
    file.close();
    std::cout << qPrintable(doc.toString());
}
EOF

qmake -project
echo "QT += xml" >> xml.pro
qmake
make
cd $src
/tmp/xml/xml source.xml > friends.xml
rm source.xml
rm -rf /tmp/xml
echo
echo ":: friends.xml generated: $src/friends.xml"
echo ":: Copy the above file to contents/ui/ directory of the applet"
echo
