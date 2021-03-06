#!/usr/bin/env python
# encoding: utf-8
"""
storeprimer.py

Created by Adam T. Lindsay on 2009-05-18.

The MIT License

Copyright (c) 2009 Adam T. Lindsay.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
"""

import sys
sys.path.append('gen-py')

from locator.ttypes import Location
from storeserver import remote_call, parser, DEFAULTPORT, SERVICENAME
from location import find_matching_service, str2loc

usage = '''
  python %prog

Looks for a storage node at PEER, either as specified, or 
auto-discovered on the localhost starting from the default 
port. Sends the NATO alphabet to prime the distributed store.'''

parser.set_usage(usage)
parser.remove_option('--port')

DICTIONARY = {
'A': 'Alpha',
'B': 'Bravo',
'C': 'Charlie',
'D': 'Delta',
'E': 'Echo',
'F': 'Foxtrot',
'G': 'Golf',
'H': 'Hotel',
'I': 'India',
'J': 'Juliet',
'K': 'Kilo',
'L': 'Lima',
'M': 'Mike',
'N': 'November',
'O': 'Oscar',
'P': 'Papa',
'Q': 'Quebec',
'R': 'Romeo',
'S': 'Sierra',
'T': 'Tango',
'U': 'Uniform',
'V': 'Victor',
'W': 'Whiskey',
'X': 'X-ray',
'Y': 'Yankee',
'Z': 'Zulu',
}

if __name__ == '__main__':
    (options, args) = parser.parse_args()
    if options.peer:
        loc = str2loc(options.peer)
    else:
        loc = find_matching_service(Location('localhost', DEFAULTPORT), SERVICENAME) or sys.exit()
    for key, value in DICTIONARY.items():
        remote_call('put', loc, key, value)
