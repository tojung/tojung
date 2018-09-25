if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js')
    .then(function(reg) {
      console.log('[Companion]', 'Service worker registered!');
    });

navigator.serviceWorker.ready
    .then((swReg) => {
      console.log("When SW is ready");
      return swReg.pushManager
        .subscribe({
          userVisibleOnly: true,
          applicationServerKey: window.vapidPublicKey
        }).then(() => (swReg)) // Return swReg back to the next .then()
    })
    .then((swReg) => {
      swReg.pushManager.getSubscription()
        .then((sub) => {
          let body = {
            subscription: sub.toJSON(),
            message: 'Hey!'
          };
          console.log(body);
          fetch('/push', {
              method: 'POST',
              body: JSON.stringify(body)
            })
            .then((res) => {
              console.log(res)
            })
            .catch((err) => {
              console.log(err)
            })
        })
    })
}
