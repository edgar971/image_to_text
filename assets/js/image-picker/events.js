import { processFiles, processFilesForPreview, previewFiles } from "./file";

export function onDragOver() {
  this.classList.add('hover')
  return false
}

export function onDragLeave() {
  this.classList.remove('hover')
}

export function onDragEnd() {
  console.log('drag end')
  return false
}

export async function onDrop(event) {
  event.preventDefault()
  const { files } = event.dataTransfer
  const { target } = event

  const validFiles = processFiles(files)
  const filesToPreview = await processFilesForPreview(validFiles)
  previewFiles(filesToPreview, this)

}

export function bindEvents(element) {
  element.ondragover = onDragOver
  element.ondragleave = onDragLeave
  element.ondragend = onDragEnd
  element.ondrop = onDrop
}