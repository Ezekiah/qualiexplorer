import os
import sys

##### PROD
sys.path.append('/store/www')
sys.path.append('/store/www/qualiexplorer')
os.environ['DJANGO_SETTINGS_MODULE'] = 'qualiexplorer.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
