// Branding overlay and break countdown for haskoli-islands-revealjs.
(function () {
  // ── Branding ────────────────────────────────────────────────────────
  function isSpeakerContext() {
    var params = new URLSearchParams(window.location.search || "");
    return params.has("receiver") || window.self !== window.top;
  }

  function updateBadge(slide) {
    var badge = document.getElementById("hi-badge");
    if (!badge) return;
    badge.style.display =
      slide && slide.classList.contains("hi-title-slide") ? "flex" : "none";
  }

  // ── Countdown ({{< pause seconds >}}) ─────────────────────────────
  var timers = new WeakMap();

  function formatTime(seconds) {
    var minutes = Math.floor(seconds / 60);
    var rest = seconds % 60;
    return minutes + ":" + String(rest).padStart(2, "0");
  }

  function ringBell() {
    var Ctx = window.AudioContext || window.webkitAudioContext;
    if (!Ctx) return;
    var ctx = new Ctx();
    var now = ctx.currentTime;
    [880, 1175, 1568].forEach(function (frequency, i) {
      var osc = ctx.createOscillator();
      var gain = ctx.createGain();
      var t = now + i * 0.18;
      osc.type = "sine";
      osc.frequency.setValueAtTime(frequency, t);
      gain.gain.setValueAtTime(0, t);
      gain.gain.linearRampToValueAtTime(0.18, t + 0.02);
      gain.gain.exponentialRampToValueAtTime(0.001, t + 0.15);
      osc.connect(gain).connect(ctx.destination);
      osc.start(t);
      osc.stop(t + 0.16);
    });
  }

  function stopTimer(slide) {
    var interval = slide && timers.get(slide);
    if (interval) {
      window.clearInterval(interval);
      timers.delete(slide);
    }
  }

  function startTimer(slide) {
    if (!slide || !slide.classList.contains("countdown-break")) return;
    stopTimer(slide);
    var display = slide.querySelector("[data-countdown-display]");
    if (!display) return;

    var duration = Number(slide.dataset.countdownSeconds || 300);
    var started = Date.now();
    slide.classList.remove("countdown-finished");

    var interval = window.setInterval(tick, 250);
    timers.set(slide, interval);
    tick();

    function tick() {
      var elapsed = Math.floor((Date.now() - started) / 1000);
      var remaining = Math.max(0, duration - elapsed);
      display.textContent = formatTime(remaining);
      slide.style.setProperty("--countdown-progress", (remaining / duration) * 100 + "%");
      if (remaining === 0) {
        stopTimer(slide);
        slide.classList.add("countdown-finished");
        if (!isSpeakerContext()) ringBell();
      }
    }
  }

  function onSlide(slide, previous) {
    updateBadge(slide);
    stopTimer(previous);
    startTimer(slide);
  }

  document.addEventListener("DOMContentLoaded", function () {
    if (isSpeakerContext()) {
      ["hi-banner", "hi-badge"].forEach(function (id) {
        var el = document.getElementById(id);
        if (el) el.style.display = "none";
      });
    }

    var attempts = 0;
    var poll = setInterval(function () {
      if (typeof Reveal !== "undefined" && Reveal.isReady()) {
        clearInterval(poll);
        if (!isSpeakerContext()) onSlide(Reveal.getCurrentSlide());
        Reveal.on("slidechanged", function (e) {
          if (isSpeakerContext()) updateBadge(null);
          else onSlide(e.currentSlide, e.previousSlide);
        });
      }
      if (++attempts > 100) clearInterval(poll);
    }, 100);
  });
})();
