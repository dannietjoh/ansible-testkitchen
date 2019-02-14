#!/usr/bin/python

import sys, ConfigParser, os

if len(sys.argv) == 4:
  profile = sys.argv[1]
  provider = sys.argv[2]
  key = sys.argv[3]
  config = ConfigParser.ConfigParser()
  config.read([os.path.expanduser("~/." + provider + "/credentials")])

  if config.has_option(profile, key):
    print config.get(profile, key)

