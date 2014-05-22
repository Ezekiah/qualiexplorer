import sys
import os
sys.path.append('/datas/www/')
sys.path.append('/datas/www/qualiexplorer')

os.environ['DJANGO_SETTINGS_MODULE'] = 'qualiexplorer.settings'

from reanalyseapp.models import *

v=Visualization.objects.all()
print v
