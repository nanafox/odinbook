import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["icon", "count"];
  static values = {
    liked: Boolean,
    count: Number,
    id: Number,
    type: String,
  };

  connect() {
    this.updateUI();
  }

  toggle(event) {
    event.preventDefault();

    const url =
      `/${this.typeValue.toLowerCase()}s/${this.idValue}/like?` +
      `likeable_type=${this.typeValue}&likeable_id=${this.idValue}`;

    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']")
          .content,
      },
    })
      .then((response) => response.json())
      .then((data) => {
        this.likedValue = data.liked;
        this.countValue = data.likes_count;
        this.updateUI();
      });
  }

  burstAnimation() {
    this.iconTarget.classList.add("animate-burst");
    setTimeout(() => {
      this.iconTarget.classList.remove("animate-burst");
    }, 500);
  }

  // update the UI with the current likes count and fill hearts where needed
  updateUI() {
    this.iconTarget.setAttribute("fill", this.likedValue ? "red" : "none");
    this.burstAnimation();
    if (this.likedValue) {
      this.iconTarget.classList.add("text-red-400");
    } else {
      this.iconTarget.classList.remove("text-red-400");
    }
    this.countTarget.textContent = this.countValue;
  }
}
