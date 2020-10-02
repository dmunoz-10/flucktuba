import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['container']

  connect() {
    this.toggleClasses = ['is-active', 'is-clipped']
    this.allowBackgroundClose = (this.data.get('allowBackgroundClose') || 'true') === 'true';
  }

  open() {
    this.containerTarget.classList.add(...this.toggleClasses)
  }

  close() {
    this.containerTarget.classList.remove(...this.toggleClasses)
  }

  closeBackground(e) {
    if (this.allowBackgroundClose && e.target === this.containerTarget) {
      this.close(e)
    }
  }

  closeWithKeyboard(e) {
    if (e.keyCode === 27 && !this.containerTarget.classList.contains('is-active', 'is-clipped')) {
      this.close()
    }
  }
}
