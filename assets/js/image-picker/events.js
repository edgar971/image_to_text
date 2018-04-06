import state from '../state'
import { validateFiles } from '../common/validateFiles'
import { createFilesForPreview } from '../common/createFilesForPreview'
import { previewFiles } from '../common/previewFiles'
import { uploadAndConvertFilesToText } from '../common/uploadAndConvertFilesToText'

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
  const validFiles = validateFiles(files)
  await previewFiles(validFiles, this)

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