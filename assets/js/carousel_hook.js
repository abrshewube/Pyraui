// Carousel Hook
export const CarouselHook = {
  mounted() {
    this.carousel = this.el
    this.track = this.carousel.querySelector(".carousel-track")
    this.slides = this.carousel.querySelectorAll(".carousel-slide")
    this.currentIndex = 0
    this.autoplay = this.carousel.dataset.autoplay === "true"
    this.interval = parseInt(this.carousel.dataset.interval) || 5000
    this.autoplayTimer = null

    if (this.autoplay && this.slides.length > 1) {
      this.startAutoplay()
    }

    // Pause autoplay on hover
    this.carousel.addEventListener("mouseenter", () => {
      this.stopAutoplay()
    })

    this.carousel.addEventListener("mouseleave", () => {
      if (this.autoplay) {
        this.startAutoplay()
      }
    })
  },

  updated() {
    // Handle updates if needed
  },

  destroyed() {
    this.stopAutoplay()
  },

  startAutoplay() {
    this.stopAutoplay()
    this.autoplayTimer = setInterval(() => {
      this.nextSlide()
    }, this.interval)
  },

  stopAutoplay() {
    if (this.autoplayTimer) {
      clearInterval(this.autoplayTimer)
      this.autoplayTimer = null
    }
  },

  nextSlide() {
    this.currentIndex = (this.currentIndex + 1) % this.slides.length
    this.updateSlide()
  },

  prevSlide() {
    this.currentIndex = (this.currentIndex - 1 + this.slides.length) % this.slides.length
    this.updateSlide()
  },

  goToSlide(index) {
    if (index >= 0 && index < this.slides.length) {
      this.currentIndex = index
      this.updateSlide()
    }
  },

  updateSlide() {
    if (this.track) {
      this.track.style.transform = `translateX(-${this.currentIndex * 100}%)`
    }
    // Update indicators
    const indicators = this.carousel.querySelectorAll(".carousel-indicator")
    indicators.forEach((indicator, index) => {
      if (index === this.currentIndex) {
        indicator.classList.add("bg-blue-600", "w-8")
        indicator.classList.remove("bg-gray-300")
      } else {
        indicator.classList.remove("bg-blue-600", "w-8")
        indicator.classList.add("bg-gray-300")
      }
    })
  }
}

