@IsTest
public with sharing class BbcNewsControllerTest {
    @IsTest
    private static void getNewsSuccessTest(){
        Test.setMock(HttpCalloutMock.class, new BbcNewsControllerMock(true));
        Test.startTest();
        Map<String, Object> result = (Map<String, Object>)BbcNewsController.invoke('getNews', null);
        List<Object> params = (List<Object>) JSON.deserializeUntyped((String)result.get('records'));
        Test.stopTest();

        System.assertEquals(10, params.size());
    }

    @IsTest
    private static void getNewsWithErrorTest(){
        Test.setMock(HttpCalloutMock.class, new BbcNewsControllerMock(false));
        Test.startTest();
        Map<String, Object> result = (Map<String, Object>)BbcNewsController.invoke('getNews', null);
        List<Object> params = (List<Object>) JSON.deserializeUntyped((String)result.get('records'));
        Test.stopTest();

        System.assertEquals(0, params.size());
    }
}