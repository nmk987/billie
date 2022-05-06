@IsTest
public with sharing class BbcNewsControllerMock implements HttpCalloutMock{
    private Boolean isSuccess;
    public BbcNewsControllerMock(Boolean p_isSuccess){
        isSuccess = p_isSuccess;
    }

    public HTTPResponse respond(HTTPRequest req) {
        String jsonString = '[{"title":"Who is Alina Kabaeva, Putin\'s alleged girlfriend?","link":"https://www.bbc.com/news/world-europe-61353020"},{"title":"Zelensky\'s red lines and Putin\'s alleged girlfriend - round-up","link":"https://www.bbc.com/news/world-europe-61347624"},{"title":"Harry and Andrew will not appear on palace balcony","link":"https://www.bbc.com/news/uk-61351158"},{"title":"Eight dead after huge blast rocks Havana hotel","link":"https://www.bbc.com/news/world-latin-america-61358186"},{"title":"Sinn Féin tops first preference vote in NI election","link":"https://www.bbc.com/news/uk-northern-ireland-61333297"},{"title":"PM says tough night for Tories amid council losses","link":"https://www.bbc.com/news/uk-politics-61343355"},{"title":"Shooting on Dutch care farm leaves two dead","link":"https://www.bbc.com/news/world-europe-61347237"},{"title":"US officer jailed over arrest of elderly woman","link":"https://www.bbc.com/news/world-us-canada-61339176"},{"title":"Depp v Heard: What you may have missed this week","link":"https://www.bbc.com/news/world-us-canada-61354294"},{"title":"Belarus plane arrest student jailed for six years","link":"https://www.bbc.com/news/world-europe-61347236"}]';
        HTTPResponse response = new HTTPResponse();
        if(isSuccess){
            response.setStatusCode(200);
        }else{
            response.setStatusCode(500);
        }
        response.setBody(jsonString);
        return response;
    }
}