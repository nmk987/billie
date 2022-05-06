import { LightningElement, track } from 'lwc';
import invoke from '@salesforce/apex/BbcNewsController.invoke';
import { LwcHelper } from "c/lwcHelper";

export default class LwcBbcNews extends LightningElement {
    @track news;
    @track isOpenSpinner = false;

    get isNews() {
        return this.news && this.news.length > 0;
    }

    connectedCallback() {
        this.isOpenSpinner = true;
        invoke({
           p_action : 'getNews',
        })
        .then(response => {
           this.news = JSON.parse(response.records);
           this.isOpenSpinner = false;
        })
        .catch(reason => {
           new LwcHelper().showToast('Error', reason.body.message, 'error');
           console.log('EXCEPTION =', JSON.stringify(reason));
           this.isOpenSpinner = false;
        });
    }
}