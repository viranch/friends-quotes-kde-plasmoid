import sys

f=open(sys.argv[1],'r')
s=f.read().replace('\n','').replace('\r','')
f.close()

f=open(sys.argv[2],'w')
f.write('<?xml version="1.0" encoding="utf-8"?><friends-quotes>')

def make_element(tag_name, tag_data):
    return '<'+tag_name+'><![CDATA['+tag_data+']]></'+tag_name+'>'

for ep in s.split('<h3>'):
    if ep == "": continue
    t = ep.split('</h3>')
    title = '<h3>'+t[0]+'</h3>'
    for q in t[1].split('<hr width="50%" />'):
        f.write('<quote>'+make_element('title', title)+make_element('content',q)+'</quote>')

f.write('</friends-quotes>')
f.close()
