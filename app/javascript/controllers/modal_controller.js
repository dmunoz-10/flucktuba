import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['container', 'background']

  connect() {
    this.toggleClassesContainer = 'is-active'
    this.toggleClassesHtml = 'is-clipped'
    this.allowBackgroundClose = (this.data.get('allowBackgroundClose') || 'true') === 'true'
    this.allowKeyboardClose = (this.data.get('allowKeyboardClose') || 'true') === 'true'
  }

  open(e = null) {
    if (e) {
      e.preventDefault()
    }

    this.containerTarget.classList.add(this.toggleClassesContainer)
    document.querySelector('html').classList.add(this.toggleClassesHtml)
  }

  async openWithGetRequest(e) {
    e.preventDefault()

    await Rails.ajax({
      url: e.srcElement.href,
      type: 'get'
    })

    this.open()
  }

  close(e = null) {
    if (e) {
      e.preventDefault()
    }

    this.containerTarget.classList.remove(this.toggleClassesContainer)
    document.querySelector('html').classList.remove(this.toggleClassesHtml)
  }

  closeBackground(e) {
    if (this.allowBackgroundClose && e.target === this.backgroundTarget) {
      this.close()
    }
  }

  closeWithKeyboard(e) {
    if (e.keyCode === 27 && this.allowKeyboardClose && this.containerTarget.classList.contains(this.toggleClassesContainer)) {
      this.close()
    }
  }
}
