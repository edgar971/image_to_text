import { bindEvents } from "./events";

const support = () => ({
  filereader: typeof FileReader != 'undefined',
  dnd: 'draggable' in document.createElement('span'),
  formdata: !!window.FormData,
  progress: "upload" in new XMLHttpRequest
})

export default function uploader(selector) {
  const dropArea = document.querySelector(selector),
        form = document.querySelector(`${selector} form`)

  if(!dropArea || !form) {
    throw new Error('Drop area or form not defined')
    return 
  }

  bindEvents(dropArea)
}