import { ShowToastEvent } from "lightning/platformShowToastEvent";

class LwcHelper {
    showToast(title, message, variant) {
        const customEvent = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        dispatchEvent(customEvent);
    }
}

export { LwcHelper }