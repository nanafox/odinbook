import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { minHeight: Number };

  connect() {
    this.expand();
  }

  expand() {
    this.element.style.height = "auto";
    const newHeight = Math.max(this.element.scrollHeight, this.minHeightValue);
    this.element.style.height = `${newHeight}px`;
  }
}
