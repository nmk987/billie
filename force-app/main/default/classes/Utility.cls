public with sharing class Utility {
    public static final Set<Integer> SUCCESS_STATUSES = new Set<Integer>{200,201,202,203,204,205,206,207,208,226};

    public static String sendRequest(String url, String method){
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod(method);
        req.setHeader('Content-Type', 'application/json');
        Http http = new Http();
        HttpResponse res = http.send(req);

        if( ! SUCCESS_STATUSES.contains(res.getStatusCode())){
            System.debug(LoggingLevel.ERROR, '**** Utility.sendRequest: ' + res.getBody());
            return null;
        }

        return res.getBody();
    }
}