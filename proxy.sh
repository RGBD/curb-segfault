#!/bin/bash

ruby -r webrick/httpproxy -e 'WEBrick::HTTPProxyServer.new(Port: 8888).start'
