import datetime
import os
import subprocess
import sys

from django.conf import settings
from django.core.management.base import CommandError

from optparse import make_option

from pyechonest.util import EchoNestException, EchoNestIOError

from rdio.auth.models import User
from rdio.auth.models import User, UserFollowers
from rdio.reporting.labels.base import reporting_date_options, BaseReportCommon, BaseReport
from rdio.utils.commands import CommandWrapper
from rdio.utils.db import chunk_query_by_ids, chunk_query, chunk_list
from rdio.utils.echonest import EchoNestAPICodes, EchonestAPI
class Command(CommandWrapper):
  """  
  Performs a command.  
  """
  option_list = CommandWrapper.option_list + (  
                    make_option('--output', dest='output', help='Output file.'),  
                ) + reporting_date_options
  
  def get_command_owner_email(self):
    return 'david.lundgren@rd.io'
  
  def start_command(self, *args, **kwargs):
    output = kwargs.get('output')    
      
    with open(output, 'wb') as fout:    
      pass
  
