final: prev: {
  polybar = prev.polybar.override {
    i3Support = true;
    pulseSupport = true;
    iwSupport = true;
  };
}