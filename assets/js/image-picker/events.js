import { processFiles, processFilesForPreview, previewFiles, uploadAndConvertFilesToText } from "./file"
import state from '../state'

export function onDragOver() {
  this.classList.add('hover')
  return false
}

export function onDragLeave() {
  this.classList.remove('hover')
}

export function onDragEnd() {
  return false
}

export async function onDrop(event) {
  event.preventDefault()
  state.setProcessing(true)
  
  const { files } = event.dataTransfer
  const { target } = event

  const validFiles = processFiles(files)
  const filesToPreview = await processFilesForPreview(validFiles)

  previewFiles(filesToPreview, this)

  try {
    const { text } = await uploadAndConvertFilesToText(validFiles)
    state.setText(text)
  } catch (e) {
    
  }

  state.setProcessing(false)
}

export function bindEvents(element) {
  element.ondragover = onDragOver
  element.ondragleave = onDragLeave
  element.ondragend = onDragEnd
  element.ondrop = onDrop
}