import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['form']

  connect() {
  }

  submit() {
    Rails.fire(this.formTarget, 'submit')
  }
}
