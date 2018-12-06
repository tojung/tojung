function initialiseUI() {
    // Set the initial subscription value
    swRegistration.pushManager.getSubscription()
        .then(function(subscription) {
            isSubscribed = !(subscription === null);

            if (isSubscribed) {
                console.log('User IS subscribed.');
            } else {
                console.log('User is NOT subscribed.');
            }

        });
}

if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js')
    .then(function(reg) {
      console.log('[Companion]', 'Service worker registered!');
    });

navigator.serviceWorker.ready
    .then((swReg) => {
      console.log("When SW is ready");
       swReg.pushManager.getSubscription()
                .then((subscription) => {
                    isSubscribed = !(subscription === null);

                    if (isSubscribed) {
                        console.log('User IS subscribed.');
                        console.log(subscription)
                    } else {
                        console.log('User is NOT subscribed.');
                        return swReg.pushManager
                            .subscribe({
                                userVisibleOnly: true,
                                applicationServerKey: window.vapidPublicKey
                            }).then(() => (swReg))
                        // Return swReg back to the next .then()
                            .then((swReg) => {
                                swReg.pushManager.getSubscription()
                                    .then((sub) => {
                                        let body = {
                                            subscription: sub.toJSON(),
                                            message: 'Hey!'
                                        };
                                        console.log(body);
                                    })
                            })
                    }
                })

    })
}
