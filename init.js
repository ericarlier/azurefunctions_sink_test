module.exports = async function (context, req) {
    context.log('Kafka Connect - HTTP trigger function processed a request.');
    context.log(req.body);

    var status = 200;
    for(var i=0;i<req.body.length;i++){
        if (req.body[i].key=="key_400")
        {
            status = 400;
            context.log('Found key_400');
            break;
        } else if (req.body[i].key=="key_500")
        {
            status = 500;
            context.log('Found key_500');
            break;
        } 
    }

    context.res = {
            status: status,
            body: req.body
    };    
};
