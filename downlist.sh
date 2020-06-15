#!/bin/bash

curl -XGET "http://elasticsearch:9200/heartbeat-*/_search" \
    -H "Content-Type: application/json" \
    -d '
    {
      "query": { 
        "bool": {
          "filter": [ 
            { "term":  { "monitor.status": "down" }},
            { "range": { "@timestamp": { "gte": "now-100s/s" }}}
          ]
        }
      }
    }
' | jq '.hits.hits[]._source.monitor.ip' | sort -u

    
