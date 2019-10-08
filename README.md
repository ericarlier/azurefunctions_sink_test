# azurefunctions_sink_test

Documentation for the Azure Functions Sink Connector is [here](https://docs.confluent.io/current/connect/kafka-connect-azure-functions/index.html)

<code>generate_data.sh</code> script creates input topic for sink connector and fill it with 100+ events
Among these 100+ events, few will make the azure function generate a 400 (keyed by 'key_400') and few a 500 error (keyed by 'key_400')

<code>init.js</code> is the body of the azure function I used

<code>azure-functions-sink.json</code> is the basic config file for the Azure function Sink Connector

<code>azure-functions-bis-sink.json</code> is the  config file for the Azure function Sink Connector using batch and parallel requests

If you use Confluent CLI, just run
1. <code>confluent local load azure-functions -- -d path/to/azure-functions-sink.json</code>
2. <code>confluent local load azure-functions-bis -- -d path/to/azure-functions-bis-sink.json</code>



