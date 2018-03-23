class Store {
  constructor(rawData) {
    this.data = {
      text: '',
      processing: false,
      error: false
    }

    this.subscriptions = {}
    this.lastSubscriptionId = 0
  }

  subscribe(callback) {
    this.lastSubscriptionId++
    this.subscriptions[this.lastSubscriptionId] = callback
    return this.lastSubscriptionId
  }

  unsubscribe(subscriptionId) {
    delete this.subscriptions[subscriptionId];
  }

  notifySubscribers() {
    Object.values(this.subscriptions).forEach((callback) => callback());
  }

  mergeWithState(stateChange) {
    this.data = {
      ...this.data,
      ...stateChange
    };
    this.notifySubscribers();
  }

  getState() {
    return this.data;
  }

  setText(text) {
    this.mergeWithState({
      text
    })
  }

  setProcessing(processing) {
    this.mergeWithState({
      processing
    })
  }
}

export default Store