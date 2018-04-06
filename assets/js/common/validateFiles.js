const ACCEPTED_FILE_TYPES = ['image/png', 'image/jpeg', 'image/gif']

function isValidFile(file) {
  if (ACCEPTED_FILE_TYPES.includes(file.type)) {
    return true
  } else {
    return false
  }
}

export function validateFiles(files) {
  return Object.values(files)
    .filter((file) => isValidFile(file))
}