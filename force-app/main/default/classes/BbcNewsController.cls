public with sharing class BbcNewsController {
    @AuraEnabled
    public static Object invoke(String p_action, Map<String, Object> p_parameters) {
        Object response = NULL;
        try {
            switch on p_action {
                when 'getNews' {
                    response = getNews();
                }
            }
        } catch (Exception e) {
            throw new BbcNewsControllerException(e.getMessage() + e.getStackTraceString());
        }
        return response;
    }

    private static Map<String, Object> getNews(){
        String response = Utility.sendRequest('callout:Heroku', 'GET');

        List<BbcNewsController.NewsDto> newsDtos = new List<BbcNewsController.NewsDto>();
        if(response != null){
            newsDtos = (List<NewsDto>)JSON.deserialize(response, List<NewsDto>.class);
            for(Integer i = 0; i < newsDtos.size(); i++){
                newsDtos.get(i).index = i + 1;
            }
        }

        return new Map<String, Object>{
            'records' => JSON.serialize(newsDtos)
        };
    }

    public class NewsDto{
        public Integer index;
        public String title;
        public String link;
    }

    public class BbcNewsControllerException extends Exception { }
}