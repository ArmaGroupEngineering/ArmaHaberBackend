#url = "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/VAN_CAT.png/600px-VAN_CAT.png"
#url = 'https://wordpress.org/plugins/about/readme.txt'

#from tqdm.tqdm import trange
from tqdm import tqdm, trange
import requests
import tempfile
import hashlib
import shutil
import os

#def filesize(url):
#    resp = requests.head(url, allow_redirects=True)
#    size = resp.headers.get('content-lenght', -1)
#    return int(size)

def fetch_bin(url):
    fp = os.path.join(tempfile.gettempdir(), url.split('/')[-1])
    if os.path.isfile(fp) and os.stat(fp).st_size > 0:
        #return os.path.abspath
        print('file exists', fp)
        return fp
    else:
        #for i in trange(filesize(url)):
        r = requests.get(url, stream=True)
        if r.status_code == 200:
            r.raw.decode_content = True

            with open(fp, 'wb') as f:
                shutil.copyfileobj(r.raw, f)

            #print("Data downloaded successfully: ", fn)
            return fp
        else: print('Download failed')


def fetch_file(url):
    fp = os.path.join(tempfile.gettempdir(), url.split('/')[-1])# hashlib.md5(url.encode('utf-8')).hexdigest())
    if os.path.isfile(fp) and os.stat(fp).st_size > 0:
        print('file exists', fp)
        return fp
    else:
        print('fetching %s' % url)
        dat = requests.get(url).content
        with open(fp, 'wb') as f:
            f.write(dat)
    return fp




#fetch_image(url)
#ret = fetch_file(url)
#import sys
#ret = fetch_file(sys.argv[1])
#print(ret)
