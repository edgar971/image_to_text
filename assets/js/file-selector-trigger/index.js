import bindEvents from './events'

export default function fileSelectorTrigger(selector) {
  const element = document.querySelector(selector)
  bindEvents(element)
}